{
  programs.nixvim.plugins.snacks.settings = {
    bigfile = { enabled = true; };

    notifier = {
      enabled = true;
      timeout = 7000;
    };
    quickfile = { enabled = false; };
    statuscolumn = { enabled = false; };
    words = {
      debounce = 100;
      enabled = true;
    };
  };
}
