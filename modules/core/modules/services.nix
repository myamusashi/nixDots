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
}
