{
  inputs,
  pkgs,
  config,
  ...
}: let
  rich-cli = import ./extra-packages/rich-cli.nix {};
in {
  home.packages = [
    pkgs.brightnessctl
    pkgs.wl-clipboard
    pkgs.nwg-look
    pkgs.gh
    pkgs.zip
    pkgs.alejandra
    pkgs.nixpkgs-fmt
    pkgs.nixfmt-classic
    pkgs.wl-gammactl
    pkgs.unzip
    pkgs.ripgrep
    pkgs.yazi
    pkgs.rofi-wayland
    pkgs.grim
    pkgs.slurp
    pkgs.hyprshot
    pkgs.swww
    pkgs.playerctl
    pkgs.pavucontrol
    pkgs.libnotify
    pkgs.jq
    pkgs.hyprpanel
		rich-cli
    pkgs.viewnior
		pkgs.mpg123
    pkgs.kdePackages.qt6ct
    pkgs.libsForQt5.qt5ct
    (config.lib.nixGL.wrap inputs.zen-browser.packages.${pkgs.system}.default)
    pkgs.nushell
    pkgs.vscodium
    pkgs.swayosd
    pkgs.rquickshare
    pkgs.enlightenment.ephoto
    pkgs.wf-recorder
    pkgs.waypaper
    pkgs.nautilus
    pkgs.power-profiles-daemon
    pkgs.hyprsunset
    pkgs.hyprpicker
    inputs.quickshell.packages.${pkgs.system}.default
  ];
}
