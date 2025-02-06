{
  inputs,
  pkgs,
  ...
}: {
  imports = [./neovide.nix];

  programs.neovim = {
    enable = true;
    package = inputs.neovim-nightly-overlay.packages.${pkgs.system}.default;
    plugins = [
      pkgs.vimPlugins.nvim-treesitter.withAllGrammars
			pkgs.vimPlugins.nvim-treesitter-parsers.latex
    ];
    extraPackages = with pkgs; [
      luajit
      alejandra
      nil # nix lsp
      gopls
      gnumake
      mesonlsp
      sassc
      llvmPackages_19.clang-unwrapped # C stuff
      gcc14
      typescript-language-server
      eslint
      sqls
      texlab
      texliveFull
      texlivePackages.latexindent
      sass
      lua54Packages.luarocks_bootstrap
      stylua
      typescript
      pnpm
      yarn
      nodejs_22
      dockerfile-language-server-nodejs
      fish-lsp
      ltex-ls
      pyright
      rust-analyzer
      marksman
      tailwindcss-language-server
      vscode-langservers-extracted # html, css, json, eslint
      bash-language-server
      shfmt # shell format
      prettierd # html, css, json formatting
      lua-language-server
    ];
  };
}
