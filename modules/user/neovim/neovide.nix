{ pkgs, ... }:

{
  programs.neovide = {
    enable = true;

    package = pkgs.neovide;
    settings = {
      vsync = false;
      srgb = true;
      neovim-bin = "nvim";
    };
  };
}
