{
  programs.foot = {
    enable = true;
    theme = "material-design";
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

      mouse = {
        hide-when-typing = true;
      };
    };
  };
}
