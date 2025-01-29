{
  programs.nixvim.plugins = {
    ## Built-in neovim
    nvim-autopairs.enable = true;
    nvim-surround.enable = true;

    ## Explore more
    neo-tree = {
      enable = true;
      enableDiagnostics = true;
      enableGitStatus = true;
      enableModifiedMarkers = true;
      autoCleanAfterSessionRestore = true;
      closeIfLastWindow = true;

      gitStatus.window.mappings = {
        A = "git_add_all";
        ga = "git_add_file";
        gc = "git_commit";
        gg = "git_commit_and_push";
        gp = "git_push";
        gr = "git_revert_file";
        gu = "git_unstage_file";
      };
    };

    ## Multicursors
    multicursors.enable = true;

    ## Telescope
    telescope.enable = true;

    ## Float terminal
    floaterm = { 
    	enable = true;
	settings.keymap_new = "<leader>t";
    };

    which-key = {
    	enable = true;
    };

  };
}
