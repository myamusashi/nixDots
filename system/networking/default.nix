{
  networking = {
    hostName = "nixos";
    networkmanager.enable = true;
    nameservers = ["1.1.1.1#one.one.one.one" "1.0.0.1#one.one.one.one"];
    extraHosts = ''
      127.0.0.1 goblok.com
    '';
    firewall = {
      enable = true;
      allowedTCPPorts = [
        80
        139
        445
        443
      ];
      allowedUDPPorts = [
        137
        138
      ];
    };
  };
}
