{ inputs, pkgs, ... }:

{
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ./utils/utils.nix

    ./modules/config/options.nix
    ./modules/config/core.nix
    ./modules/config/colorscheme.nix
    ./modules/config/keymaps.nix
    ./modules/config/neovide.nix

    ./modules/plugins/snacks.nix
    ./modules/plugins/lualine.nix
    ./modules/plugins/neo_tree.nix
    ./modules/plugins/autopairs.nix
    ./modules/plugins/cmp_nvim.nix
    ./modules/plugins/noice.nix
    ./modules/plugins/dashboard.nix
    ./modules/plugins/project_nvim.nix
  ];

  programs.nixvim = {
    enable = true;
    package = inputs.neovim-nightly-overlay.packages.${pkgs.system}.default;
    clipboard.providers.wl-copy.enable = true;
    globals = {
        mapleader = " ";
    };

    extraConfigLua = ''
	require("config.core")
	require("config.keymaps")
	require("config.neovide")
	require("config.options")
    '';
  };
}
