{
  imports = [
    ./config/config.nix
    ./services/services.nix
    ./users/users.nix
    ./network/network.nix
    ./packages/packages.nix
    ./boot/boot.nix
    ./programs/programs.nix
    ./security/security.nix
    ./systemd/duckdns.nix
  ];
}
