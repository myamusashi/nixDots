{
  config,
  lib,
  pkgs,
  modulesPath,
  ...
}: {
 # imports = [
  #  (modulesPath + "/installer/scan/not-detected.nix")
  #];
  #fileSystems."/" = {
  #  device = "/dev/disk/by-uuid/c60c5a1c-9d19-4395-9bca-671bebddc679";
  #  fsType = "ext4";
  #};

  #fileSystems."/boot" = {
  #  device = "/dev/disk/by-uuid/F5DD-1B31";
  #  fsType = "vfat";
  #  options = ["fmask=0077" "dmask=0077"];
  #};

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/a5362b34-884c-4e93-9335-39cd58c6099c";
      fsType = "ext4";
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/2F37-5B4A";
      fsType = "vfat";
      options = [ "fmask=0077" "dmask=0077" ];
    };

  swapDevices =
    [ { device = "/dev/disk/by-uuid/bc8df5b1-687d-451a-831e-41d1bff3280c"; }
    ];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp0s31f6.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlp3s0.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
  #swapDevices = [{device = "/dev/disk/by-uuid/93afed54-632b-44f3-9964-ce444b239fc9";}];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  #networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.CloudflareWARP.useDHCP = lib.mkDefault true;
  # networking.interfaces.docker0.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp0s31f6.useDHCP = lib.mkDefault true;
  # networking.interfaces.vmnet1.useDHCP = lib.mkDefault true;
  # networking.interfaces.vmnet8.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlp4s0.useDHCP = lib.mkDefault true;

  #nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  #hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

  fileSystems."/run/media/apalah" = {
    device = "/dev/disk/by-label/apalah";
    fsType = "ntfs-3g";
    options = [
      "rw"
      "uid=1000"
      "gid=100"
      "umask=022"
      "nofail"
    ];
  };

  fileSystems."/run/media/extn" = {
    device = "/dev/disk/by-label/extn";
    fsType = "ext4";
    options = [
      "noatime"
      "nodiratime"
      "uid=1000"
      "gid=100"
      "umask=022"
      "discard"
      "nofail"
    ];
  };

	systemd.tmpfiles.rules = [
		"L /run/media/apalah - - - - /home/myamusashi/external_drive"
		"L /run/media/extn - - - - /home/myamusashi/ssd"
	];
}
