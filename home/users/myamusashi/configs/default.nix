{
  pkgs,
  nixgl,
  ...
}: {
  home = {
    username = "myamusashi";
    homeDirectory = "/home/myamusashi";
    stateVersion = "24.11";
  };

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

  nix.settings.trusted-users = ["myamusashi"];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
