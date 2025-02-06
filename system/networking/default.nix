{
  networking.hostName = "nixos";
  # networking.wireless.enable = true;
  networking.networkmanager.enable = true;
  networking.nameservers = ["1.1.1.1#one.one.one.one" "1.0.0.1#one.one.one.one"];

  networking = {
    firewall = {
      enable = true;
      allowedTCPPorts = [];
    };
  };
}
