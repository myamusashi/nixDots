{
  networking.hostName = "nixos";
  # networking.wireless.enable = true;
  networking.networkmanager.enable = true;

  networking = {
    firewall = {
      enable = true;
      allowedTCPPorts = [ 80 ];
    };
  };
}
