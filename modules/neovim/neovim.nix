{ pkgs, ... }:

{
    programs.neovim = {
        enable = true;
        extraPackages = with pkgs; [
            llvmPackages_19.clang-unwrapped # C stuff
            nixpkgs-fmt
            nil # nix lsp
            pnpm
            yarn
            nodejs_22
            rustup
            python3
            gopls
            gnumake
            meson
            ninja
            cmake
            zig
            sassc
            typescript-language-server
            eslint
            sqls
            texlab
            texliveFull
            texlivePackages.latexindent
            go
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
