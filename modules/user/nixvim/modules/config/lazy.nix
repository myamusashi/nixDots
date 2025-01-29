{ pkgs, ... }:

{
  programs.nixvim.plugins = {
    lazy.enable = true;
    lazy.package = pkgs.vimPlugins.lazy-nvim;
  };
}
