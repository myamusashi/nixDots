{
  config,
  lib,
  pkgs,
  modulesPath,
  ...
}: {
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];
  fileSystems."/" = {
    device = "/dev/disk/by-uuid/c60c5a1c-9d19-4395-9bca-671bebddc679";
    fsType = "ext4";
    options = [
      "noatime" # Menonaktifkan update access time untuk mengurangi writes
      "nodiratime" # Menonaktifkan directory access time
      "commit=60" # Flush data ke disk setiap 60 detik (default 5)
      "errors=remount-ro" # Remount sebagai read-only saat error
      "discard" # Enable TRIM untuk SSD (jika menggunakan SSD)
      "barrier=1" # Ensure metadata integrity (default di ext4)
      "data=ordered" # Default write ordering mode
      "journal_checksum" # Checksum untuk journal (meningkatkan integritas)
    ];
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/F5DD-1B31";
    fsType = "vfat";
    options = ["fmask=0077" "dmask=0077"];
  };

  swapDevices = [{device = "/dev/disk/by-uuid/93afed54-632b-44f3-9964-ce444b239fc9";}];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.CloudflareWARP.useDHCP = lib.mkDefault true;
  # networking.interfaces.docker0.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp0s31f6.useDHCP = lib.mkDefault true;
  # networking.interfaces.vmnet1.useDHCP = lib.mkDefault true;
  # networking.interfaces.vmnet8.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlp4s0.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

  fileSystems = {
    "/home/myamusashi/external_drive" = {
      device = "/dev/disk/by-label/apalah";
      fsType = "ntfs-3g";
      options = [
        "rw"
        "uid=1000"
        "gid=100"
        "umask=022"
        "windows_names"
        "nofail"
				"nossd"
        "x-systemd.automount"
      ];
    };
    "/home/myamusashi/ssd" = {
      device = "/dev/disk/by-label/extn";
      fsType = "ext4";
      options = [
        "noatime"
        "nodiratime"
        "discard"
        "nofail"
        "x-systemd.device-timeout=5s"
      ];
    };
  };
}
