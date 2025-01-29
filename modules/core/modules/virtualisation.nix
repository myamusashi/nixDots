{ pkgs, ... }:

{
  virtualisation.vmware.host.enable = true;
  virtualisation.vmware.guest.enable = true;

  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;

  nixpkgs.config.packageOverrides = pkgs: { intel-vaapi-driver = pkgs.intel-vaapi-driver.override { enableHybridCodec = true; }; };
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [
      intel-media-driver # LIBVA_DRIVER_NAME=iHD
      vaapiIntel # LIBVA_DRIVER_NAME=i965 (older but works better for Firefox/Chromium)
    ];
  };

  virtualisation.docker.enable = true;
  virtualisation.libvirtd.enable = true;
}
