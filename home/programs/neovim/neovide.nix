{pkgs, config, ...}: {
  programs.neovide = {
    enable = true;
    settings = {
      vsync = false;
      srgb = true;
      neovim-bin = "nvim";
    };
  };
}
