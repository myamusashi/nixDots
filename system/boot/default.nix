{
  pkgs,
  lib,
  ...
}: {
  boot.kernelPackages = pkgs.linuxPackages_cachyos;
  boot.initrd.availableKernelModules = ["xhci_pci" "ahci" "usbhid" "sd_mod" "rtsx_pci_sdmmc"];
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.supportedFilesystems = ["ntfs"];
  boot.kernelModules = ["kvm-intel" "uas" "usbhid" "hid" "usb_storage" "zram"];
  boot.kernelParams = ["console=tty1" "noibrs" "noibpb" "nopti" "nospectre_v2" "nospectre_v1" "l1tf=off" "nospec_store_bypass_disable" "no_stf_barrier" "mds=off" "mitigations=off"];

  boot.kernel.sysctl = {
    "net.core.default_qdisc" = "fq";
    "net.ipv4.tcp_congestion_control" = "bbr";

    "net.core.rmem_max" = 16777216;
    "net.core.wmem_max" = 16777216;
    "net.ipv4.tcp_rmem" = "4096 87380 16777216";
    "net.ipv4.tcp_wmem" = "4096 87380 16777216";

    "net.ipv4.tcp_fastopen" = 3;
    "net.ipv4.tcp_slow_start_after_idle" = 0;
    "net.ipv4.tcp_mtu_probing" = 1;

    "net.core.somaxconn" = 1024;
    "net.core.netdev_max_backlog" = 5000;

    "net.ipv4.tcp_window_scaling" = 1;

    "net.ipv4.tcp_keepalive_time" = 60;
    "net.ipv4.tcp_keepalive_intvl" = 10;
    "net.ipv4.tcp_keepalive_probes" = 6;

    "vm.vfs_cache_pressure" = 50;
    "vm.dirty_ratio" = 10;
		"vm.swappiness" = 35;
  };
}
