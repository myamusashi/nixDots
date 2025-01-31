{
  programs.nixvim.plugins.project-nvim.settings = {
    detection_methods = [ "lsp" "pattern" ];
    patterns =
      [ ".git" "_darcs" ".hg" ".bzr" ".svn" "flake.nix" "Makefile" "meson.build" "CMakeLists.txt" "package.json" ];
    ignore_lsp = [ "clangd" ];
    showHidden = false;
    silent_chdir = false;
    data_path = { __raw = "vim.fn.stdpath('data')"; };
  };
}
