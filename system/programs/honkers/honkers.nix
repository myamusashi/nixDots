let
  aagl-gtk-on-nix = import (fetchTarball {
    url = "https://github.com/ezKEa/aagl-gtk-on-nix/archive/main.tar.gz";
    sha256 = "0f59radafvzdfn3ar1y6glx9ixc9hbvysaalsp492ixp8ihpkbxv";
  });
in {
  imports = [aagl-gtk-on-nix.module];

  programs.honkers-railway-launcher.enable = true;
}
