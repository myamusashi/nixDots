{
  programs.foot = {
    enable = true;
    settings = {
      main = {
        font = "CaskaydiaMono Nerd Font:size=10";
        font-size-adjustment = 0.7;
        box-drawings-uses-font-glyphs = true;
        dpi-aware = true;
        workers = 1;
      };

      cursor = {
        style = "beam";
        beam-thickness = 1;
      };

      colors = {
        foreground = "E5E9F0";
        background = "0F111A";
        regular0 = "00010A"; #black
        regular1 = "FF4151"; #red
        regular2 = "A3BE8C"; #green
        regular3 = "EBCB8B"; #yellow
        regular4 = "81A1C1"; #blue
        regular5 = "B48EAD"; #magenta
        regular6 = "88C0D0"; #cyan
        regular7 = "F9F6EE"; #white
      };

      mouse = {
        hide-when-typing = true;
      };
    };
  };
}
