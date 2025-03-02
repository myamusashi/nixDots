{
  inputs,
  pkgs,
  ...
}: {
  imports = [./neovide.nix];

  programs.neovim = {
    enable = true;
    package = inputs.neovim-nightly-overlay.packages.${pkgs.system}.default;
    plugins = with pkgs.vimPlugins; [
      (nvim-treesitter.withPlugins (plugins: pkgs.tree-sitter.allGrammars))
      (nvim-treesitter.withPlugins (
        plugins:
          with plugins; [
            tree-sitter-c
            tree-sitter-cpp
            tree-sitter-dockerfile
            tree-sitter-fish
            tree-sitter-go
            tree-sitter-html
            tree-sitter-json
            tree-sitter-latex
            tree-sitter-lua
            tree-sitter-nix
            tree-sitter-python
            tree-sitter-r
            tree-sitter-regex
            tree-sitter-rust
            tree-sitter-toml
            tree-sitter-vim
            tree-sitter-yaml
            tree-sitter-toml
          ]
      ))
    ];
    extraPackages = with pkgs; [
      alejandra
      lemminx
      nil # nix lsp
      gopls
      nixd
      gnumake
      mesonlsp
      sassc
      ccls
      llvmPackages_19.clang-unwrapped # C stuff
      gcc14
      libgcc
      typescript-language-server
      sqls
      sass
      lua54Packages.luarocks_bootstrap
      stylua
      typescript
      nodejs_23
      dockerfile-language-server-nodejs
      fish-lsp
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
