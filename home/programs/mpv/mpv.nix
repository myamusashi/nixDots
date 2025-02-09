{
  pkgs,
  config,
  ...
}: {
  programs.mpv = {
    enable = true;
    package = config.lib.nixGL.wrap pkgs.mpv;
    config = {
      vo = "gpu";
      gpu-context = "wayland";
			hwdec="auto-safe";
			sub-font="JetBrainsMono Nerd Font";
			sub-bold=true;
			profile="high-quality";
			video-sync="display-resample";
    };
		defaultProfiles = [
			"gpu-hq"
		];
  };
}
