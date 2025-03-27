{
  inputs,
  pkgs,
  config,
  ...
}: {
  home.packages = [
    pkgs.brightnessctl
    pkgs.wl-clipboard
    pkgs.gh
    pkgs.zip
    pkgs.alejandra
    pkgs.statix
    pkgs.nixfmt-classic
    pkgs.wl-gammactl
    pkgs.unzip
    pkgs.ripgrep
    pkgs.yazi
    pkgs.rofi-wayland
    pkgs.grim
    pkgs.slurp
    pkgs.hyprshot
    pkgs.ffmpegthumbnailer
    pkgs.swww
    pkgs.playerctl
    pkgs.pavucontrol
    pkgs.libnotify
    pkgs.jq
    pkgs.hyprpanel
    pkgs.viewnior
    pkgs.rich-cli
    pkgs.mpg123
    pkgs.zathura
    pkgs.kdePackages.qt6ct
    pkgs.libsForQt5.qt5ct
    (config.lib.nixGL.wrap inputs.zen-browser.packages.${pkgs.system}.default)
    pkgs.nushell
    pkgs.geogebra
    pkgs.wf-recorder
    pkgs.waypaper
    pkgs.power-profiles-daemon
    pkgs.hyprsunset
    pkgs.hyprpicker
    pkgs.telegram-desktop
    # inputs.quickshell.packages.${pkgs.system}.default
  ];
}
