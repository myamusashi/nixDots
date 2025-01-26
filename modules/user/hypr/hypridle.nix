{ inputs, pkgs, ... }:

let CWD = "$HOME/.config/home-manager/modules/user/hypr";
in {
  services.hypridle = {
    enable = true;
    package = inputs.hypridle.packages.${pkgs.stdenv.hostPlatform.system}.hypridle;

    settings = {
      general = {
        lock_cmd = "hyprlock";
        unlock_cmd = "notify-send 'woilah cik!'";
      };

      listener = [
        {
          timeout = 200;
          on-timeout = "notify-send -a 'Hypridle' 'Idle' 'Bangun woy, gua kunci nih' -i ${CWD}/scripts/User-idle.png";
        }

        {
          timeout = 500;
          on-timeout = "hyprlock -c $HOME/.config/hypr/lock_listen.conf";
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
