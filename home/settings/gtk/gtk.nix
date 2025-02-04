{
  pkgs,
  lib,
	config,
  ...
}: let
  future-cyan-hyprcursor = pkgs.callPackage ./themes/cursors/Future-cyan-hyprcursor/package.nix {};
  future-cursor = pkgs.callPackage ./themes/cursors/future-cursor/package.nix {};
in {
  home.activation.createSymlink = lib.hm.dag.entryAfter ["writeBoundary"] ''
		mkdir -p $HOME/.local/share/icons
		mkdir $HOME/.icons
		ln -sf $HOME/.dots/home/programs/hypr/scripts /tmp
    ln -sf ${future-cyan-hyprcursor}/share/icons/Future-Cyan-Hyprcursor_Theme $HOME/.icons/Future-cyan-hyprcursor
		ln -sf $HOME/.nix-profile/share/themes $HOME/.themes
  '';

  home.packages = [
    pkgs.gtk-engine-murrine
    pkgs.gtk3
    pkgs.gtk4
    pkgs.morewaita-icon-theme
    pkgs.vimix-icon-theme
    pkgs.numix-icon-theme
    (pkgs.vimix-gtk-themes.override {
      themeVariants = ["beryl"];
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
  gtk = {
    enable = true;

    iconTheme = {name = "MoreWaita";};
    theme = {name = "vimix-dark-compact-ruby";};

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
