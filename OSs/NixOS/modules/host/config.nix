{
  pkgs,
  inputs,
  ...
}: let
  root = {
    absolute = "/home/lousp/Kife/";
    relative = "../../../../";
  };

  wrappedpkgs = inputs.self.packages.x86_64-linux;
in {
  imports = [./hardware.nix];

  environment = {
    sessionVariables = {
      NH_FLAKE = "/home/lousp/Kife/OSs/NixOS";
      NIXPKGS_ALLOW_UNFREE = "1";
      NIXOS_OZONE_WL = "1";
      EDITOR = "hx";
    };

    systemPackages = with pkgs; [
      libnotify

      unzip
      wget

      home-manager
      blueman
      alsa-utils
      pavucontrol
    ];

    localBinInPath = true;
  };

  programs.hyprland = {
    package = wrappedpkgs.hyprland;
    enable = true;
  };

  programs.steam.enable = true;

  fonts.packages = [ pkgs.nerd-fonts.jetbrains-mono ];

  users.users.lousp = {
    isNormalUser = true;
    description = "Jhuan Nycolas";
    shell = pkgs.nushell;
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
  };

  time.timeZone = "America/Sao_Paulo";
  i18n.defaultLocale = "pt_BR.UTF-8";

  services.xserver = {
    enable = true;

    xkb = {
      layout = "br";
      variant = "abnt2";
    };
  };

  console.useXkbConfig = true;

  networking = {
    hostName = "Kife";
    networkmanager.enable = true;
  };

  security.pam.services.hyprlock = {};

  services = {
    flatpak.enable = true;
    upower.enable = true;

    pipewire = {
      enable = true;
      pulse.enable = true;
    };

    displayManager.sddm.enable = true;
  };

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

  boot = {
    loader = {
      grub = {
        enable = true;
        efiSupport = true;
        devices = ["nodev"];
        efiInstallAsRemovable = true;
        splashImage = builtins.toPath root.absolute + "/assets/wallpapers/gruvbox-solar-system.png";
      };
    };

    consoleLogLevel = 0;
    initrd.verbose = false;
    kernelParams = [
      "quiet"
      "splash"
    ];
  };

  nix.settings.experimental-features = "nix-command flakes";
  nixpkgs.config.allowUnfree = true;

  system.stateVersion = "25.05";
}
