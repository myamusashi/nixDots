{inputs, ...}: {
  programs.yazi = {
    enable = true;
    # keymap = {
    # 	manager.prepend_keymap= [
    # 		{ run = "plugin eza-preview", desc = ""}
    # 	];
    # };
    plugins = {
      mediainfo = ./plugins/mediainfo;
      glow = ./plugins/glow;
      hexyl = ./plugins/hexyl;
      ouch = ./plugins/ouch;
      rich-preview = ./plugins/rich-preview;
      yatline = ./plugins/yatline;
      yatline-symlink = ./plugins/yatline-symlink;
      lazygit = ./plugins/lazygit;
      githead = ./plugins/githead;
    };
  };
}
