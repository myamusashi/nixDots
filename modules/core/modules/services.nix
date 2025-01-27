{ pkgs, ... }:

{
  services.cloudflare-warp.enable = true;

  services.xserver.videoDrivers = [ "vmware" ];

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    #jack.enable = true;
  };

  services.blueman.enable = true;
  services.upower.enable = true;
  services.power-profiles-daemon.enable = true;
  services.openssh.enable = true;

  services.udisks2.enable = true;

  services.gns3-server = {
    enable = true;
    settings = {
      Server = {
        appliances_path = "/home/myamusashi/GNS3/appliances";
        configs_path = "/home/myamusashi/GNS3/configs";
        images_path = "/home/myamusashi/GNS3/images";
        projects_path = "/home/myamusashi/GNS3/projects";
        symbols_path = "/home/myamusashi/GNS3/symbols";
      };
    };
  };

  services.greetd = {
    enable = true;
    vt = 2;
    settings = {
      default_session = {
        command = ''
          ${pkgs.greetd.tuigreet}/bin/tuigreet tuigreet --remember --remember-user-session --time --asterisks --asterisks-char "+" --greeting "Loh kok bisa"  --theme border=magenta;text=cyan;prompt=green;time=red;action=blue;button=yellow;container=black;input=red --cmd Hyprland'';
        user = "greeter";
      };
    };
  };

  systemd.services."getty@tty2".enable = false;
}
