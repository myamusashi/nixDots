{pkgs, ...}: {
  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        terminal = "${pkgs.kitty}/bin/kitty";
        layer = "overlay";
      };
      colors.background = "1E1F28FF";
      colors.text = "DCD7BAFF";
      colors.border = "E6C384FF";
      colors.match = "363646FF";
      colors.selection = "54546DFF";
      colors.selection-match = "2A2A37FF";
      colors.selection-text = "938AA9FF";
    };
  };
}
