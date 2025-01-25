{ config, pkgs, ... }:

{
  home.packages = [
    pkgs.gtk-engine-murrine
    # pkgs.gtk2
    pkgs.gtk3
    pkgs.gtk4
    pkgs.morewaita-icon-theme
    pkgs.vimix-icon-theme
    (pkgs.nightfox-gtk-theme.override {
      colorVariants = [ "dark" ];
      sizeVariants = [ "compact" ];
      themeVariants = [ "default" ];
      tweakVariants = [ "carbon" ];
    })
    pkgs.numix-icon-theme
    (pkgs.vimix-gtk-themes.override {
      themeVariants = [ "ruby" ];
      colorVariants = [ "dark" ];
      sizeVariants = [ "compact" ];
      tweaks = [ "flat" ];
    })
  ];

  home.pointerCursor = {
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 32;
    gtk.enable = true;
    x11.enable = true;
  };
  gtk = {
    enable = true;

    iconTheme = { name = "MoreWaita"; };
    theme = { name = "Vimix-dark-doder"; };

    gtk2 = {
      #configLocation = "${config.home.homeDirectory}/.gtkrc-2.0";
      extraConfig = ''
        gtk-application-prefer-dark-theme = 1
        gtk-toolbar-style = GTK_TOOLBAR_ICONS
        gtk-toolbar-icon-size = GTK_ICON_SIZE_LARGE_TOOLBAR
        gtk-button-images = 0
        gtk-menu-images = 0
        gtk-enable-event-sounds = 1
        gtk-enable-input-feedback-sounds = 0
        gtk-xft-antialias = 1
        gtk-xft-hinting = 1
        gtk-xft-hintstyle = hintslight
        gtk-xft-rgba = rgb
      '';
    };
    gtk3 = {
      #configLocation = "${config.xdg.configHome}/gtk-3.0/settings.ini";
      extraConfig = {
        "gtk-application-prefer-dark-theme" = 1;
        "gtk-toolbar-style" = "GTK_TOOLBAR_ICONS";
        "gtk-toolbar-icon-size" = "GTK_ICON_SIZE_LARGE_TOOLBAR";
        "gtk-button-images" = 0;
        "gtk-menu-images" = 0;
        "gtk-enable-event-sounds" = 1;
        "gtk-enable-input-feedback-sounds" = 0;
        "gtk-xft-antialias" = 1;
        "gtk-xft-hinting" = 1;
        "gtk-xft-hintstyle" = "hintslight";
        "gtk-xft-rgba" = "rgb";
      };
    };
    gtk4 = {
      #configLocation = "${config.xdg.configHome}/gtk-4.0/settings.ini";
      extraConfig = { "gtk-application-prefer-dark-theme" = 1; };
    };
  };
}
