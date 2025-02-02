{
  inputs,
  pkgs,
  ...
}: {
  services.hypridle = {
    enable = true;
    package = pkgs.hypridle;

    settings = {
      general = {
        lock_cmd = "hyprlock";
        unlock_cmd = "notify-send 'woilah cik!'";
      };

      listener = [
        {
          timeout = 200;
          on-timeout = "notify-send -a 'Hypridle' 'Idle' 'Bangun woy, gua kunci nih' -i ./scripts/User-idle.png";
        }

        {
          timeout = 500;
          on-timeout = "hyprlock -c ./scripts/lock_listen.conf";
        }

        {
          timeout = 700;
          on-timeout = "wl-gammactl -c 0.5";
          on-resume = "pkill wl-gammactl";
        }
        # {
        #   timeout = 2000;
        #   on-timeout = "sysmtectl suspend";
        # }
      ];
    };
  };
}
