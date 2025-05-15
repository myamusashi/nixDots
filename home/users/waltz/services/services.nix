{
  lib,
  pkgs-stable,
  config,
  ...
}: {
  services.cloudflared = {
    enable = true;
  };

  services.nginx = {
    enable = true;
    virtualHosts."myamusashi.com" = {
      forceSSL = true;
      enableACME = false;
      sslCertificate = "/etc/nginx/ssl/cert.pem";
      sslCertificateKey = "/etc/nginx/ssl/key.pem";
      http2 = true;
      serverName = "myamusashi.com";
      locations."/" = {
        proxyPass = "http://unix:/run/forgejo/forgejo.sock";
        extraConfig = ''
          proxy_set_header Host $host;
          proxy_set_header X-Real-IP $remote_addr;
          proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
          proxy_set_header X-Forwarded-Proto $scheme;
          client_max_body_size 512M;
        '';
      };
    };
  };

  services.forgejo = {
    enable = true;
    database.type = "postgres";
    lfs.enable = true;
    settings = {
      server = {
        PROTOCOL = "http+unix";
        DOMAIN = "git.myamusashi.space";
        ROOT_URL = "https://git.myamusashi.space";
        HTTP_ADDR = "/run/forgejo/forgejo.sock";
        HTTP_PORT = 3000;
      };
      actions = {
        ENABLED = true;
        DEFAULT_ACTIONS_URL = "github";
      };
      session = {
        COOKIE_SECURE = true;
      };
    };
  };

  # Enable automatic login for the user.
  services.getty.autologinUser = "waltz";

  services.logind.lidSwitchExternalPower = "ignore";

  services.vsftpd = {
    enable = true;
    writeEnable = true;
    localUsers = true;
    localRoot = "/var/ftp";
    extraConfig = ''
      local_umask=007
    '';
  };
}
