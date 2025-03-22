{pkgs, ...}: {
  services = {
    cloudflare-warp.enable = true;
    xserver.videoDrivers = ["vmware"];
    scx.enable = true;

    nix-serve = {
      enable = false;
      secretKeyFile = "/var/cache-priv-key.pem";
    };

    printing.enable = false;
    udisks2.enable = true;

    gvfs.enable = true;

    flatpak.enable = false;

    xserver.xkb = {
      layout = "us";
      variant = "";
    };

    blueman.enable = true;
    upower.enable = true;
    power-profiles-daemon.enable = true;
    openssh.enable = true;

    locate.package = pkgs.mlocate;
    locate.enable = true;

    httpd.enable = true;
    httpd.enablePHP = true; # oof... not a great idea in my opinion

    httpd.virtualHosts."example.org" = {
      # want ssl + a let's encrypt certificate? add `forceSSL = true;` right here
    };

    phpfpm = {
      phpPackage = pkgs.php84;
      phpOptions = ''
        date.timezone = "Asia/Jakarta"
        ;memory_limit = 256M
        ;max_execution_time = 60

        #zend_extension = ${pkgs.php84}/lib/php/extensions/opcache.so
        #opcache.enable = 0
        #opcache.memory_consumption = 64
        #opcache.interned_strings_buffer = 16
        #opcache.max_accelerated_files = 10000
        #opcache.max_wasted_percentage = 5
        #opcache.use_cwd = 1
        #opcache.validate_timestamps = 1
        #opcache.revalidate_freq = 2
        #opcache.fast_shutdown = 1
      '';
    };

    tlp = {
      enable = false;
      settings = {
        ## CPU
        INTEL_GPU_MIN_FREQ_ON_AC = 300;
        INTEL_GPU_MIN_FREQ_ON_BAT = 300;

        INTEL_GPU_MAX_FREQ_ON_AC = 999999999;
        INTEL_GPU_MAX_FREQ_ON_BAT = 999999999;

        INTEL_GPU_BOOST_FREQ_ON_AC = 0;
        INTEL_GPU_BOOST_FREQ_ON_BAT = 0;

        CPU_SCALING_GOVERNOR_ON_AC = "performance";
        CPU_SCALING_GOVERNOR_ON_BAT = "schedutil";

        ## Battery
        START_CHARGE_THRESH_BAT0 = 75;
        STOP_CHARGE_THRESH_BAT0 = 80;

        START_CHARGE_THRESH_BAT1 = 75;
        STOP_CHARGE_THRESH_BAT1 = 80;

        TPSMAPI_ENABLE = 1;

        ## Kernel
        NMI_WATCHDOG = 0;
      };
    };

    mysql = {
      enable = true;
      package = pkgs.mariadb;
    };
  };

  systemd.services."getty@tty2".enable = false;
}
