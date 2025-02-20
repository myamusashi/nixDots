let
  aagl-gtk-on-nix = import (fetchTarball {
    url = "https://github.com/ezKEa/aagl-gtk-on-nix/archive/main.tar.gz";
    sha256 = "0v59frhfnyy7pbmbv7bdzssdp554bjsgmmm4dw31p5askysmlvib";
  });
in {
  imports = [aagl-gtk-on-nix.module];

  programs.honkers-railway-launcher.enable = true;
}
