{pkgs, ...}: {
  systemd.timers.duckdns = {
    wantedBy = ["timers.target"];
    timerConfig = {
      OnCalendar = "*:0/5"; # Runs every 5 minutes
      Persistent = true;
    };
  };

  systemd.services.duckdns = {
    description = "Duck DNS configuration";
    serviceConfig = {
      Type = "oneshot";
      ExecStart = "${pkgs.writeShellScript "duck.sh" ''
        ${pkgs.bash}/bin/bash /home/waltz/scripts/duck.sh
      ''}";
    };
  };
}
