{ pkgs, config, lib, ... }:

let
  cfg = config.services.gns3-server;

  settingsFormat = pkgs.formats.ini { };
  configFile = settingsFormat.generate "gns3-server.conf" cfg.settings;

in {
  services.cloudflare-warp.enable = true;

  services.xserver.videoDrivers = [ "vmware" ];

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    #jack.enable = true;
  };

  services.blueman.enable = true;
  services.upower.enable = true;
  services.power-profiles-daemon.enable = true;
  services.openssh.enable = true;

  services.udisks2.enable = true;

  services.gns3-server = {
    enable = true;
    settings = {
      Server = {
        appliances_path = "/home/myamusashi/GNS3/appliances";
        configs_path = "/home/myamusashi/GNS3/configs";
        images_path = "/home/myamusashi/GNS3/images";
        projects_path = "/home/myamusashi/GNS3/projects";
        symbols_path = "/home/myamusashi/GNS3/symbols";
      };
    };
  };

  services.greetd = {
    enable = true;
    vt = 2;
    settings = {
      default_session = {
        command = ''
          ${pkgs.greetd.tuigreet}/bin/tuigreet tuigreet --remember --remember-user-session --time --asterisks --asterisks-char "+" --greeting "Loh kok bisa"  --theme border=magenta;text=cyan;prompt=green;time=red;action=blue;button=yellow;container=black;input=red --cmd Hyprland'';
        user = "greeter";
      };
    };
  };

  systemd.services."getty@tty2".enable = false;

  # systemd.services.gns3-server = let
  #   commandArgs = lib.cli.toGNUCommandLineShell { } {
  #     config = "/home/myamusashi/.config/GNS3/2.2/2.2/gns3_server.conf";
  #     pid = "/run/gns3/server.pid";
  #     log = cfg.log.file;
  #     ssl = cfg.ssl.enable;
  #     # These are implicitly not set if `null`
  #     certfile = cfg.ssl.certFile;
  #     certkey = cfg.ssl.keyFile;
  #   };
  # in {
  #   after = [ "network.target" "network-online.target" ];
  #   wantedBy = [ "multi-user.target" ];
  #   wants = [ "network-online.target" ];
  #
  #   preStart = ''
  #     install -m660 ${configFile} /home/myamusashi/.config/GNS3/2.2/gns3_server.conf
  #
  #     ${lib.optionalString cfg.auth.enable ''
  #       ${pkgs.replace-secret}/bin/replace-secret \
  #         '@AUTH_PASSWORD@' \
  #         "''${CREDENTIALS_DIRECTORY}/AUTH_PASSWORD" \
  #         /home/myamusashi/.config/GNS3/2.2/gns3_server.conf
  #     ''}
  #   '';
  #
  #   reloadTriggers = [ configFile ];
  #
  #   serviceConfig = lib.mkDefault {
  #     ConfigurationDirectory = "gns3";
  #     ConfigurationDirectoryMode = "0750";
  #     Environment = "HOME=/home/myamusashi";
  #     ExecReload = "${pkgs.coreutils}/bin/kill -HUP $MAINPID";
  #     ExecStart = "${lib.getExe cfg.package} ${commandArgs}";
  #     Group = "gns3";
  #     LimitNOFILE = 16384;
  #     LoadCredential = lib.mkIf cfg.auth.enable [ "AUTH_PASSWORD:${cfg.auth.passwordFile}" ];
  #     LogsDirectoryMode = "0750";
  #     PIDFile = "/run/gns3/server.pid";
  #     Restart = "on-failure";
  #     RestartSec = 5;
  #   };
  # };
}
