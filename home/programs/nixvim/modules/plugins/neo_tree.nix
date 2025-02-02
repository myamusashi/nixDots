{
  programs.nixvim.plugins.neo-tree = {
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
}
