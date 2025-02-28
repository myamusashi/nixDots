{pkgs, ...}: let
  wluma = pkgs.callPackage ./package.nix {};
in {
  services.wluma = {
    enable = true;
    package = wluma;
    settings = {
      als.time = {
        thresholds = {
          "0" = "night";
          "8" = "day";
          "18" = "night";
        };
      };
      output.backlight = [
        {
          name = "eDP-1";
          path = "/sys/class/backlight/intel_backlight";
          capturer = "wayland";
          predictor.manual = {
            thresholds = {
              day = {
                "0" = 0;
                "100" = 10;
              };
              night = {
                "0" = 0;
                "100" = 60;
              };
            };
          };
        }
      ];
    };
  };
}
