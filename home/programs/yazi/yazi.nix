{inputs, ...}: {
  programs.yazi = {
    enable = true;
    # keymap = {
    # 	manager.prepend_keymap= [
    # 		{ run = "plugin eza-preview", desc = ""}
    # 	];
    # };
    plugins = {
      mediainfo = ./plugins/mediainfo.yazi;
      glow = ./plugins/glow.yazi;
      hexyl = ./plugins/hexyl.yazi;
      ouch = ./plugins/ouch.yazi;
      rich-preview = ./plugins/rich-preview.yazi;
      yatline = ./plugins/yatline.yazi;
      yatline-symlink = ./plugins/yatline-symlink.yazi;
      lazygit = ./plugins/lazygit.yazi;
      githead = ./plugins/githead.yazi;
    };
  };
}
