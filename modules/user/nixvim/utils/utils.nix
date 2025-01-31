{
  programs.nixvim.plugins = {
    ## Built-in neovim
    nvim-autopairs.enable = true;
    nvim-surround.enable = true;

    ## Explore more
    neo-tree.enable = true;

    ## Multicursors
    # multicursors.enable = true;

    ## Telescope
    telescope.enable = true;

    ## Float terminal
    floaterm = {
      enable = true;
      settings.keymap_new = "<leader>t";
    };

    ## Which key
    which-key = { enable = true; };

    ## Toggle comment
    ts-comments.enable = true;

    ## UI stuff
    snacks.enable = true;
    dashboard.enable = true;
    lualine.enable = true;
    noice.enable = true;
    web-devicons.enable = true;
    mini.enable = true;

    ## Projects nvim
    project-nvim.enable = true;
    project-nvim.enableTelescope = true;

    ## LSP and stuff
    cmp.enable = true;
    friendly-snippets.enable = true;
    nvim-snippets.enable = true;

    ## Codesnap
    codesnap.enable = true;
    codesnap.settings = {
      breadcrumbs_separator = "/";
      has_breadcrumbs = true;
      has_line_number = false;
      mac_window_bar = true;
      save_path = "~/Pictures/screenshot/";
      title = "CodeSnap.nvim";
      watermark = "";
    };
  };
}
