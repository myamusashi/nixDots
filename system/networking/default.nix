{
  networking = {
    hostName = "nixos";
    networkmanager.enable = true;
    nameservers = ["1.1.1.1#one.one.one.one" "1.0.0.1#one.one.one.one"];
    firewall = {
      enable = true;
      allowedTCPPorts = [
        139
        445
        991 # for rquickshare
      ];
      allowedUDPPorts = [
        137
        138
      ];
    };
  };
}
