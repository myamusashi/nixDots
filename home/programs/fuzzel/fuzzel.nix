{pkgs, ...}: {
  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        terminal = "${pkgs.kitty}/bin/kitty";
        layer = "overlay";
      };
      colors.background = "171717ff";
      colors.text = "dcd7baff";
      colors.border = "e6c384ff";
      colors.match = "363646ff";
      colors.selection = "54546dff";
      colors.selection-match = "2a2a37ff";
      colors.selection-text = "938aa9ff";
    };
  };
}
