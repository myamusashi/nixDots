{ inputs, pkgs, ... }:

{
  imports = [ ./neovide.nix ];

  programs.neovim = {
    enable = true;
    # package = inputs.neovim-nightly.${pkgs.system}.neovim-nightly;
    extraPackages = with pkgs; [
      # coding
      vimPlugins.lazydev-nvim
      vimPlugins.mini-pairs
      vimPlugins.ts-comments-nvim
      vimPlugins.mini-ai
      ## colorscheme
      vimPlugins.material-nvim
      ## editor
      vimPlugins.neo-tree-nvim
      vimPlugins.grug-far-nvim
      vimPlugins.flash-nvim
      vimPlugins.which-key-nvim
      vimPlugins.gitsigns-nvim
      vimPlugins.trouble-nvim
      vimPlugins.todo-comments-nvim
      ## formatting
      vimPlugins.conform-nvim
      ## linting
      vimPlugins.nvim-lint
      ## lsp
      vimPlugins.nvim-lspconfig
      ## treesitter
      vimPlugins.nvim-treesitter
      vimPlugins.nvim-treesitter-textobjects
      vimPlugins.nvim-ts-autotag
      ## ui
      vimPlugins.bufferline-nvim
      vimPlugins.lualine-nvim
      vimPlugins.noice-nvim
      vimPlugins.mini-icons
      vimPlugins.nui-nvim
      vimPlugins.snacks-nvim
      ## util
      vimPlugins.persistence-nvim
      vimPlugins.plenary-nvim
      vimPlugins.distant-nvim
      luajit
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
