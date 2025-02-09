{pkgs, ...}: {
  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        terminal = "${pkgs.kitty}/bin/kitty";
        layer = "overlay";
      };
    };
    colors.background = "1e1e2eff";
    colors.text = "cdd6f4ff";
    colors.border = "f38ba8ff";
    colors.match = "585b70ff";
    colors.selection = "f38ba8ff";
    colors.selection-match = "cdd6f4ff";
    colors.selection-text = "b4befeff";
  };
}
