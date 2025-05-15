{pkgs, ...}: {
  systemd.services.tunnel = {
    wantedBy = ["multi-user.target"];
    after = ["network-online.target" "systemd-resolved.service"];
    serviceConfig = {
      ExecStart = "${pkgs.cloudflared}/bin/cloudflared tunnel --no-autoupdate run --credentials-file ";
      Restart = "always";
      User = "cloudflared";
      Group = "cloudflared";
    };
  };
}
