{
  # Open ports in the firewall.
  networking.firewall.allowedTCPPorts = [
    21
    22
    80
    443
    990 # ftps
    989 # ftps
		3000 # forgejo
  ];
  networking.firewall.allowedUDPPorts = [
    21
    22
    80
    443
    990 # ftps
    989 # ftps
		3000 # forgejo
  ];

	networking.extraHosts = ''
		192.168.18.14 myamusashi.com
		127.0.0.1 myamusashi.com
	'';
  # Or disable the firewall altogether.
  networking.firewall.enable = true;
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;
}
