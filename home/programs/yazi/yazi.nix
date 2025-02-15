{pkgs, ...}: let
  yazi-plugins = import ./plugins.nix {inherit pkgs;};
in {
  programs.yazi = {
    enable = true;
    # keymap = {
    # 	manager.prepend_keymap= [
    # 		{ run = "plugin eza-preview", desc = ""}
    # 	];
    # };
    plugins = {
      chmod = "${yazi-plugins.chmod}/chmod.yazi";
      diff = "${yazi-plugins.diff}/diff.yazi";
      full-border = "${yazi-plugins.full-border}/full-border.yazi";
      git = "${yazi-plugins.git}/git.yazi";
      hide-preview = "${yazi-plugins.hide-preview}/hide-preview.yazi";
      mount = "${yazi-plugins.mount}/mount.yazi";
      mime-ext = "${yazi-plugins.mime-ext}/mime-ext.yazi";
      mediainfo = "${yazi-plugins.mediainfo}";
      glow = "${yazi-plugins.glow}";
      hexyl = "${yazi-plugins.hexyl}";
      ouch = "${yazi-plugins.ouch}";
      rich-preview = "${yazi-plugins.rich-preview}";
      yatline = "${yazi-plugins.yatline}";
      yatline-symlink = "${yazi-plugins.yatline-symlink}/yatline-symlink.yazi";
      lazygit = "${yazi-plugins.lazygit}";
      githead = "${yazi-plugins.githead}";
    };
  };
}
