{ inputs, pkgs, ... }:

{
  home.packages = [
    pkgs.brightnessctl
    pkgs.wl-clipboard
    pkgs.gtk-engine-murrine
    # pkgs.gtk2
    pkgs.gtk3
    pkgs.gtk4
    pkgs.vimix-icon-theme
    (pkgs.nightfox-gtk-theme.override {
      colorVariants = [ "dark" ];
      sizeVariants = [ "compact" ];
      themeVariants = [ "default" ];
      tweakVariants = [ "carbon" ];
    })
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
    inputs.zen-browser.packages.${pkgs.system}.default
    pkgs.hyprpanel
    pkgs.fastfetch
    pkgs.neovide
    pkgs.swayosd
    pkgs.legcord
    pkgs.btop
    pkgs.htop
    pkgs.rquickshare
    pkgs.enlightenment.ephoto
    pkgs.mpv
    pkgs.lazygit
    pkgs.wf-recorder
    pkgs.waypaper
    pkgs.nautilus
    pkgs.power-profiles-daemon
    pkgs.polkit_gnome
    pkgs.hyprsunset
  ];
}
