{
  pkgs-stable,
  config,
  ...
}: {
  systemd.services.tunnel = {
    wantedBy = ["multi-user.target"];
    after = ["network-online.target" "systemd-resolved.service"];
    environment = {
      TUNNEL_ORIGIN_CERT = "/home/waltz/.cloudflared/cert.pem";
    };
    serviceConfig = {
      ExecStart = "${pkgs-stable.cloudflared}/bin/cloudflared tunnel --no-autoupdate --origincert /home/waltz/.cloudflared/cert.pem  run --credentials-file ${config.sops.secrets.cloudflare_creds.path} NixHome_Server";
      Restart = "always";
      User = "cloudflared";
      Group = "cloudflared";
    };
  };
}
