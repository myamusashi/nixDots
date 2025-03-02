{
  programs.wlogout = {
    enable = true;
    style = ./style.css;
    layout = [
      {
        label = "shutdown";
        action = "systemctl poweroff";
        text = "Mati";
        keybind = "s";
      }
      {
        label = "reboot";
        action = "systemctl reboot";
        text = "Reboot";
        keybind = "r";
      }
      {
        label = "sleep";
        action = "systemctl suspend";
        text = "Turu";
        keybind = "t";
      }
      {
        label = "hibernate";
        action = "systemctl hibernate";
        text = "Hibernate";
        keybind = "h";
      }
      {
        label = "lock";
        action = "loginctl lock-session";
        text = "konci";
        keybind = "l";
      }
      {
        label = "logout";
        action = "hyprctl dispatch exit";
        text = "keluar";
        keybind = "e";
      }
    ];
  };
}
