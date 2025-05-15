{inputs, ...}: let
  SopsFilePath = ../../../../secrets.yaml;
in {
  imports = [
    inputs.sops-nix.nixosModules.sops
  ];

  sops = {
    age.keyFile = "/home/waltz/.config/sops/age/keys.txt";

    defaultSopsFile = SopsFilePath;
    defaultSopsFormat = "yaml";

    secrets.cloudflare_creds = {
      path = "/run/credentials/cloudflared-tunnel-7549a153-4952-488e-8056-711737089bf4.service/credentials.json";
      owner = "cloudflared";
      group = "cloudflared";
      mode = "0644";
    };
  };
}
