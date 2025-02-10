{
  programs.ghostty = {
    enable = true;
    settings = {
      font-family = "JetBrainsMono NF SemiBold";
      font-family-bold = "JetBrainsMono NF Bold";
      font-family-italic = "JetBrainsMono NF Bold Italic";
      font-synthetic-style = true;
      font-size = 11;

      theme = "nord";
      background-opacity = 0.9;
      background-blur-radius = 5;

      keybind = "ctrl+t=new_tab";

      window-padding-color = "extend";
      window-vsync = false;
      window-decoration = false;
      window-height = 10;
      window-width = 5;

      image-storage-limit = 80;
      custom-shader-animation = true;
    };
  };
}
