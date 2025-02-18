{
  pkgs,
  lib,
  config,
  ...
}: let
  vimix-icon = pkgs.callPackage ./icons/vimix-icon-themes/package.nix {colorVariants = ["Ruby"];};
  future-cyan-hyprcursor = pkgs.callPackage ./themes/cursors/Future-cyan-hyprcursor/package.nix {};
  future-cursor = pkgs.callPackage ./themes/cursors/future-cursor/package.nix {};
in {
  home.packages = [
    pkgs.gtk-engine-murrine
    pkgs.gtk3
    pkgs.gtk4
    future-cyan-hyprcursor
    pkgs.morewaita-icon-theme
    vimix-icon
    # pkgs.vimix-icon-theme
    # pkgs.numix-icon-theme
		pkgs.papirus-icon-theme
    pkgs.kdePackages.qtstyleplugin-kvantum
    pkgs.libsForQt5.qt5ct
    (pkgs.vimix-gtk-themes.override {
      themeVariants = ["ruby"];
      colorVariants = ["dark"];
      sizeVariants = ["standard"];
      tweaks = ["translucent"];
    })
  ];

  home.pointerCursor = {
    package = future-cursor;
    name = "Future-cursors";
    size = 40;
    gtk.enable = true;
    x11.enable = true;
  };

  qt = {
    enable = true;
    style = {
      name = "kvantum";
      package = pkgs.gruvbox-kvantum;
    };
  };

  gtk = {
    enable = true;

    iconTheme = {name = "Vimix-Ruby";};
    theme = {name = "vimix-dark-standard-ruby";};

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
      extraConfig = {"gtk-application-prefer-dark-theme" = 1;};
    };
  };
}
