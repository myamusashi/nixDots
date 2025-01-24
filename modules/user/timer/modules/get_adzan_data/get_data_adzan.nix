{ pkgs, ... }:

{
  systemd.user.timers.get-adzan-data = {
    Unit = { Description = "Timer update data adzan"; };
    Timer = {
      OnCalendar = "0/6:00:00";
      Persistent = true;
      Unit = "get-adzan-data";
    };
    Install = { WantedBy = [ "timers.target" ]; };
  };

  systemd.user.services.get-adzan-data = {
    Unit = { Description = "Service mendapatkan data adzan"; };
    Service = {
      Type = "oneshot";
      ExecStart = "${pkgs.writeShellScript "get-adzan-data" ''
        /run/current-system/sw/bin/bash $HOME/.config/eww/script/adzan_info
      ''}";
    };
  };

}
