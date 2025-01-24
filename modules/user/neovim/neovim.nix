{ pkgs, ... }:

{
  imports = [ ./neovide.nix ];

  programs.neovim = {
    enable = true;
    extraPackages = with pkgs; [
      llvmPackages_19.clang-unwrapped # C stuff
      nixpkgs-fmt
      nixfmt-classic
      nil # nix lsp
      gopls
      gnumake
      mesonlsp
      sassc
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
