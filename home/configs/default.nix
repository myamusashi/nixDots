{pkgs, ...}: {
  home.username = "myamusashi";
  home.homeDirectory = "/home/myamusashi";

  home.stateVersion = "24.11";

  fonts.fontconfig.enable = true;

  xdg.portal = {
    enable = true;
    extraPortals = [pkgs.xdg-desktop-portal-gtk];
    config = {
      common.default = "gtk";
      pantheon.default = "gtk";
      gtk.default = "gtk";
    };
  };

  programs.git = {
    enable = true;
    userName = "myamusashi";
    userEmail = "jinxprogilang666@gmail.com";
    aliases = {
      ci = "commit";
      sw = "checkout";
      s = "status";
    };
    lfs.enable = true;
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
