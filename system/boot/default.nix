{
  pkgs,
  lib,
  ...
}: {
  # boot.kernelPackages = let
  #   patchDir = ./extra-packages/kernel-patch;
  #
  #   # Baca isi direktori dan filter file .patch
  #   patchFiles =
  #     lib.mapAttrsToList
  #     (name: type: {
  #       inherit name;
  #       path = patchDir + "/${name}";
  #     })
  #     (lib.filterAttrs
  #       (name: type: type == "regular" && lib.hasSuffix ".patch" name)
  #       (builtins.readDir patchDir));
  #
  #   customConfigs = import ./extra-packages/kernel-config.nix {inherit lib;};
  #   linux_tkg_pds_pkg = {
  #     fetchurl,
  #     buildLinux,
  #     ...
  #   } @ args:
  #     buildLinux (args
  #       // rec {
  #         version = "6.13.1";
  #         modDirVersion = version;
  #
  #         src = fetchurl {
  #           url = "https://www.kernel.org/pub/linux/kernel/v6.x/linux-${version}.tar.xz";
  #           hash = "sha256-8BH2yOpHHfGz273R6yYbKckuQzYFA8Pr0AW+7CFVtmo=";
  #         };
  #         # kernelPatches = lib.forEach patchFiles (file: {
  #         #   name = "patch-${lib.removeSuffix ".patch" file.name}";
  #         #   patch = file.path;
  #         # });
  #
  #         extraStructureConfig = customConfigs;
  #
  #         extraMeta.branch = "linux-tkg-pds-${version}";
  #       }
  #       // (args.argsOverride or {}));
  #   linux_tkg_pds = pkgs.callPackage linux_tkg_pds_pkg {};
  # in
  #   pkgs.recurseIntoAttrs (pkgs.linuxPackagesFor linux_tkg_pds);
  boot.kernelPackages = pkgs.linuxPackages_zen;
  boot.initrd.availableKernelModules = ["xhci_pci" "ahci" "usbhid" "sd_mod" "rtsx_pci_sdmmc"];
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.supportedFilesystems = ["ntfs"];
  boot.kernelModules = ["kvm-intel" "uas" "usbhid" "hid" "usb_storage"];
  boot.kernelParams = ["console=tty1"];

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
  };
}
