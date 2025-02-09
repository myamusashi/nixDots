{
  nix.settings.trusted-users = ["root" "myamusashi"];
  imports = [
    ./boot/default.nix
    ./config/default.nix
    ./networking/default.nix
    ./packages/default.nix
    ./programs/default.nix
    ./security/default.nix
    ./services/default.nix
    ./users/default.nix
  ];
}
