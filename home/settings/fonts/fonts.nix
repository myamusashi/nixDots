{pkgs, ...}: let
  feather-font = pkgs.callPackage ./packages/feather-font.nix {};
	avenirLTPro-font = pkgs.callPackage ./packages/avenir-font.nix {};
in {
  home.packages = [
    feather-font
		avenirLTPro-font
    pkgs.nerd-fonts.caskaydia-mono
    pkgs.nerd-fonts.comic-shanns-mono
    pkgs.nerd-fonts.proggy-clean-tt
    pkgs.nerd-fonts.jetbrains-mono
    pkgs.nerd-fonts.inconsolata-lgc
  ];
}
