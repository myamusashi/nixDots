{
  programs.wlogout = {
    enable = true;
    style = ./style.css;
    layout = [
      {
        label = "shutdown";
        action = "bash $HOME/.dots/home/programs/wlogout/confirm.sh shutdown";
        text = "Mati";
        keybind = "s";
      }
      {
        label = "reboot";
        action = "bash $HOME/.dots/home/programs/wlogout/confirm.sh reboot";
        text = "Reboot";
        keybind = "r";
      }
      {
        label = "sleep";
        action = "bash $HOME/.dots/home/programs/wlogout/confirm.sh suspend";
        text = "Turu";
        keybind = "t";
      }
      {
        label = "hibernate";
        action = "bash $HOME/.dots/home/programs/wlogout/confirm.sh hibernate";
        text = "Hibernate";
        keybind = "h";
      }
      {
        label = "lock";
        action = "bash $HOME/.dots/home/programs/wlogout/confirm.sh lock";
        text = "konci";
        keybind = "l";
      }
      {
        label = "logout";
        action = "bash $HOME/.dots/home/programs/wlogout/confirm.sh logout";
        text = "keluar";
        keybind = "e";
      }
    ];
  };
}
