{
  lib,
  pkgs,
	config,
  ...
}: let
  kitty_themes = pkgs.callPackage "./themes/package.nix";
in {
  programs.kitty = lib.mkForce {
    enable = true;
    themeFile = "GitHub_Dark_High_Contrast";
    settings = {
      confirm_os_window_close = 0;

      font_size = 11.0;

      cursor_trail = 1;
      cursor_trail_decay = "0.1 0.2";
      cursor_shape = "beam";
      cursor_beam_thickness = 1.5;
      cursor_underline_thickness = 2.0;
      cursor_stop_blinking_after = 15.0;
      cursor_trail_start_threshold = 0;
      shell_integration = "no-cursor";

      disable_ligatures = "never";

      scrollback_lines = 2000;

      wheel_scroll_multiplier = 5.0;
      mouse_hide_wait = 3.0;

      detect_urls = true;
      url_color = "#0087bd";
      url_style = "curly";
      open_url_with = "default";

      copy_on_select = false;
      strip_trailing_spaces = "never";

      focus_follows_mouse = false;

      default_pointer_shape = "beam";

      repaint_delay = 1;
      input_delay = 1;
      sync_to_monitor = false;
      enable_audio_bell = false;

      enabled_layouts = "grid";
      window_resize_step_cells = 2;
      window_resize_step_lines = 2;
      window_border_width = "0.5pt";
      draw_minimal_borders = true;
      window_margin_width = 0;
      single_window_margin_width = -1;
      window_padding_width = 0;
      placement_strategy = "center";
      active_border_color = "#00ff00";
      inactive_border_color = "#cccccc";
      inactive_text_alpha = 1.0;
      hide_window_decorations = false;
      tab_bar_style = "powerline";
      tab_separator = " ┇";

      background_opacity = 0.8;
      background_image = "none";
      background_image_layout = "tiled";
      background_image_linear = false;
      dynamic_background_opacity = true;
      background_tint = 1;
      dim_opacity = 1;

      font_family = "Inconsolata LGC Nerd Font";
      bold_font = "auto";
      italic_font = "auto";
      bold_italic_font = "auto";
    };
  };
}
