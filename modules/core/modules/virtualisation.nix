{ pkgs, ... }:

{
  virtualisation.vmware.host.enable = true;
  virtualisation.vmware.guest.enable = true;
  hardware.pulseaudio.enable = false;

  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [
      intel-media-driver # LIBVA_DRIVER_NAME=iHD
      vaapiIntel # LIBVA_DRIVER_NAME=i965 (older but works better for Firefox/Chromium)
    ];
  };

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;
  #fileSystems."/home/myamusashi/external_drive" = { 
  #    device = "/dev/disk/by-label/apalah";
  #    fsType = "ntfs-3g"; 
  #    options = [ "defaults" "uid=022" ];
  #};
}
