{
  inputs,
  pkgs,
  ...
}: {
  home.packages = [
    pkgs.brightnessctl
    pkgs.wl-clipboard
    pkgs.nwg-look
    pkgs.sassc
    pkgs.sass
    pkgs.gh
    pkgs.zip
    pkgs.nixpkgs-fmt
    pkgs.nixfmt-classic
    pkgs.wl-gammactl
    pkgs.unzip
    pkgs.ripgrep
    pkgs.eza
    pkgs.yazi
    pkgs.cliphist
    pkgs.fuzzel
    pkgs.rofi
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
    pkgs.hicolor-icon-theme
    pkgs.adwaita-icon-theme
    pkgs.adwaita-qt6
		pkgs.gitea
		pkgs.papirus-icon-theme
    inputs.zen-browser.packages.${pkgs.system}.default
    pkgs.hyprpanel
    pkgs.spotify-qt
    pkgs.themix-gui
    pkgs.nushell
    pkgs.vscodium
    pkgs.fastfetch
    pkgs.neovide
    pkgs.swayosd
    pkgs.legcord
    pkgs.btop
    pkgs.htop
    pkgs.rquickshare
    pkgs.enlightenment.ephoto
    pkgs.mpv
    pkgs.udiskie
    pkgs.udisks
    pkgs.python313Packages.pygithub
    pkgs.lazygit
    pkgs.wf-recorder
    pkgs.waypaper
    pkgs.nautilus
    pkgs.power-profiles-daemon
    pkgs.polkit_gnome
    pkgs.hyprsunset
    pkgs.hyprpicker
    inputs.quickshell.packages.${pkgs.system}.default
  ];
}
