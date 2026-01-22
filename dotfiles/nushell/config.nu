$env.config = {
  buffer_editor: "hx"
  edit_mode: "vi"
  show_banner: false
  table: {
    mode: "rounded"
  }

  hooks: {
    pre_prompt: [{ ||
      if (which direnv | is-empty) {
        return
      }

      direnv export json | from json | default {} | load-env
      if 'ENV_CONVERSIONS' in $env and 'PATH' in $env.ENV_CONVERSIONS {
        $env.PATH = do $env.ENV_CONVERSIONS.PATH.from_string $env.PATH
      }
    }]
  }
}

$env.BAT_THEME = "base16"
$env.FZF_DEFAULT_OPTS = "--reverse --border=rounded --style=minimal --height=40 --preview 'bat --color always --style numbers,changes --line-range :500 {}' --color=16"

def --env yy [...args] {
  let tmp = (mktemp -t "yazi-cwd.XXXXX")
  yazi ...$args --cwd-file $tmp
  let cwd = (open $tmp)
  if $cwd != "" and $cwd != $env.PWD {
    cd $cwd
  }
  rm -fp $tmp
}

# zoxide init nushell | save -f ~/.zoxide.nu
source ~/.zoxide.nu

mkdir ($nu.data-dir | path join "vendor/autoload")
starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")

alias bonsai = cbonsai -lip
alias cat = bat
alias cd = z
# alias hx = helix

alias l =  eza --tree --icons --git
alias ls = eza --icons --git
alias recorder = wf-recorder

alias mine = java -jar ~/Downloads/SKlauncher.jar

# alias nhs = nh home switch
# alias nos = nh os switch
# alias nosu = nh os switch -u
# alias kife = nh os

# alias u = ame upgrade
# alias r = ame remove
# alias i = ame install
# alias s = ame search
