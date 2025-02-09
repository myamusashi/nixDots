{
  inputs,
  pkgs,
  config,
  ...
}: {
  home.packages = [
    pkgs.brightnessctl
    pkgs.wl-clipboard
    pkgs.nwg-look
    pkgs.sassc
    pkgs.sass
    pkgs.nodejs_23
    pkgs.gh
    pkgs.zip
    pkgs.nixpkgs-fmt
    pkgs.nixfmt-classic
    pkgs.wl-gammactl
    pkgs.unzip
    pkgs.ripgrep
    pkgs.yazi
    pkgs.cliphist
    pkgs.rofi-wayland
    pkgs.mutt
    pkgs.grim
    pkgs.slurp
    pkgs.hyprshot
    pkgs.swww
    pkgs.playerctl
    pkgs.pavucontrol
    pkgs.telegram-desktop
    pkgs.libnotify
    pkgs.jq
    pkgs.viewnior
    pkgs.kdePackages.qt6ct
    pkgs.libsForQt5.qt5ct
    pkgs.kdePackages.dolphin
    pkgs.gitea
    (config.lib.nixGL.wrap inputs.zen-browser.packages.${pkgs.system}.default)
    pkgs.hyprpanel
    pkgs.spotify-qt
    pkgs.nushell
    (config.lib.nixGL.wrap pkgs.vscodium)
    (config.lib.nixGL.wrap pkgs.neovide)
    pkgs.swayosd
    pkgs.legcord
    pkgs.rquickshare
    pkgs.enlightenment.ephoto
    pkgs.python313Packages.pygithub
    pkgs.wf-recorder
    pkgs.waypaper
    pkgs.nautilus
    pkgs.power-profiles-daemon
    pkgs.hyprsunset
    pkgs.hyprpicker
    inputs.quickshell.packages.${pkgs.system}.default
  ];
}
