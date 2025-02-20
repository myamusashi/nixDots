{pkgs, ...}: {
  services.cloudflare-warp.enable = true;

  services.xserver.videoDrivers = ["vmware"];

  services.scx.enable = true;

  services.printing.enable = false;

  services.udisks2.enable = true;

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  services.blueman.enable = true;
  services.upower.enable = true;
  services.power-profiles-daemon.enable = true;
  services.openssh.enable = true;

  services.locate.package = pkgs.mlocate;
  services.locate.enable = true;

  systemd.services."getty@tty2".enable = false;
}
