{pkgs, ...}: {
  services = {
    cloudflare-warp.enable = true;
    xserver.videoDrivers = ["vmware"];
    scx.enable = true;

    nix-serve = {
      enable = false;
      secretKeyFile = "/var/cache-priv-key.pem";
    };

    printing.enable = false;
    udisks2.enable = true;

    xserver.xkb = {
      layout = "us";
      variant = "";
    };

    blueman.enable = true;
    upower.enable = true;
    power-profiles-daemon.enable = true;
    openssh.enable = true;

    locate.package = pkgs.mlocate;
    locate.enable = true;
  };

  systemd.services."getty@tty2".enable = false;
}
