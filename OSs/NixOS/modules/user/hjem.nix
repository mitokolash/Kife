{ pkgs, inputs, ... }: let
  wrappedpkgs = inputs.self.packages.x86_64-linux;
in {
  hjem.users.lousp = {
    imports = [./dotfiles.nix];
    
    packages = with pkgs; [
      nh
      typescript-language-server
      nodejs
      yarn

      clang
      clang-tools

      steam-run
      jdk

      lua
      lua-language-server

      go

      vesktop
      spotify

      blender
      audacity
      obs-studio
      godot-mono

      nwg-look
      walker

      gcc
      nil
      alejandra
      rustup
      zig
      zls

      zoxide
      starship
      fastfetch

      swww
      wl-clipboard

      bibata-cursors
      papirus-icon-theme
      catppuccin-gtk
      libadwaita

      bat
      cava
      cbonsai
      cmatrix
      ripgrep
      eza
      less
      pipes
      wf-recorder
      btop
      fzf

      firefox

      helix
      neovim
      ghostty
      git
      hypridle

      grimblast

    ] ++ (with wrappedpkgs; [
      zellij
      dunst
      hyprlock
      # hypridle
      waybar
    ]);
  };
}
