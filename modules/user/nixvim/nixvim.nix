{ inputs, pkgs, lib, nixvimLib, ... }:

{ 
  imports = [ 
    inputs.nixvim.homeManagerModules.nixvim
    ./utils/utils.nix
    ./modules/config/options.nix
    ./modules/config/lazy.nix
    ./modules/config/colorscheme.nix
    ./modules/config/keymaps.nix
  ];

  programs.nixvim = {
    enable = true;
    package = inputs.neovim-nightly-overlay.packages.${pkgs.system}.default;
    clipboard.providers.wl-copy.enable = true;
  };
}
