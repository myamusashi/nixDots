{
  config,
  pkgs,
  ...
}: {
  nixpkgs.config.packageOverrides = pkgs: {
    intel-vaapi-driver = pkgs.intel-vaapi-driver.override {enableHybridCodec = true;};
  };

  hardware = {
    bluetooth = {
      enable = true;
      powerOnBoot = true;
    };

    graphics = {
      enable = true;
      enable32Bit = true;
      extraPackages = with pkgs; [
        intel-media-driver # LIBVA_DRIVER_NAME=iHD
        vaapiIntel # LIBVA_DRIVER_NAME=i965 (older but works better for Firefox/Chromium)
      ];
      extraPackages32 = with pkgs.pkgsi686Linux; [
        intel-media-driver
        intel-vaapi-driver
      ];
    };
  };

  chaotic.mesa-git.enable = true;

  virtualisation = {
    docker.enable = true;
    libvirtd.enable = true;
    podman = {
      enable = false;
      dockerCompat = true;
      defaultNetwork.settings = {dns_enabled = true;};
    };
    #  oci-containers = {
    # enable = false;
    # backend = "podman";
    #    containers = {
    #      phpmyadmin = import ./container/phpmyadmin.nix;
    #    };
    #  };
    vmware = {
      host.enable = true;
      guest = {
        enable = true;
        package = pkgs.open-vm-tools;
      };
    };
  };

  systemd.services.create-podman-network = with config.virtualisation.oci-containers; {
    serviceConfig.Type = "oneshot";
    wantedBy = ["${backend}-phpmyadmin.service"];
    script = ''${pkgs.podman}/bin/podman network exists net_macvlan || \ ${pkgs.podman}/bin/podman network create --driver=macvlan --gateway=192.168.1.1 --subnet=192.168.1.0/24 -o parent=wlp3s0 net_macvlan'';
  };
  system.activationScripts = {
    script.text = ''
      install -d -m 755 /home/myamusashi/phpmyadmin -o root -g root
      test -f /home/myamusashi/phpmyadmin/config.user.inc.php || echo -e "<?php\n\n\$cfg['ShowPhpInfo'] = true; // Adds a link to phpinfo() on the home page\n\$cfg['SendErrorReports'] = 'never';" > /home/myamusashi/phpmyadmin/config.user.inc.php
    '';
  };
}
