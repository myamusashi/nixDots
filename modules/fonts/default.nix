{ pkgs, ... }:

let feather-font = pkgs.callPackage ./packages/feather-font.nix { };

in {
  home.packages = [
    feather-font
    pkgs.nerd-fonts.caskaydia-mono
    pkgs.nerd-fonts.comic-shanns-mono
    pkgs.nerd-fonts.proggy-clean-tt
    pkgs.nerd-fonts.jetbrains-mono
    pkgs.nerd-fonts.inconsolata-lgc
  ];
}
