{pkgs, ...}: let
  yazi-plugins = import ./plugins/package.nix {inherit pkgs;};
in {
  home.packages = with pkgs; [
    mediainfo
    ouch
  ];
  programs.yazi = {
    enable = true;
    initLua = ./init.lua;
    flavors = {
      kanagawa = "${yazi-plugins.kanagawa}";
    };
    theme.flavor = {
      dark = "kanagawa";
    };
    plugins = {
      chmod = "${yazi-plugins.official-plugins}/chmod.yazi";
      diff = "${yazi-plugins.official-plugins}/diff.yazi";
      full-border = "${yazi-plugins.official-plugins}/full-border.yazi";
      git = "${yazi-plugins.official-plugins}/git.yazi";
      hide-preview = "${yazi-plugins.official-plugins}/hide-preview.yazi";
      mount = "${yazi-plugins.official-plugins}/mount.yazi";
      mime-ext = "${yazi-plugins.official-plugins}/mime-ext.yazi";
      eza-preview = "${yazi-plugins.eza-preview}";
      mediainfo = "${yazi-plugins.mediainfo}";
      fg = "${yazi-plugins.fzf}";
      glow = "${yazi-plugins.glow}";
      hexyl = "${yazi-plugins.hexyl}";
      ouch = "${yazi-plugins.ouch}";
      yatline = "${yazi-plugins.yatline}";
      yatline-symlink = "${yazi-plugins.yatline-symlink}/yatline-symlink.yazi";
      lazygit = "${yazi-plugins.lazygit}";
      githead = "${yazi-plugins.githead}";
    };
    keymap = {
      manager.prepend_keymap = [
        {
          on = ["E"];
          run = "plugin eza-preview";
          desc = "Toggle tree/list dir preview";
        }
        {
          on = ["-"];
          run = "plugin eza-preview --args='--inc-level'";
          desc = "Increment tree level";
        }
        {
          on = ["_"];
          run = "plugin eza-preview --args='--dec-level'";
          desc = "Decrement tree level";
        }
        {
          on = ["$"];
          run = "plugin eza-preview --args='--toggle-follow-symlinks'";
          desc = "Toggle tree follow symlinks";
        }

        {
          on = ["<C-d>"];
          run = "plugin diff";
          desc = "Diff the selected with the hovered file";
        }
        {
          on = ["g" "i"];
          run = "plugin lazygit";
          desc = "run lazygit";
        }
        {
          on = ["T"];
          run = "plugin hide-preview";
          desc = "Hide or show preview";
        }
        {
          on = ["M"];
          run = "plugin mount";
        }
        {
          on = ["<C-e>"];
          run = "seek 5";
        }
        {
          on = ["<C-y>"];
          run = "seek -5";
        }
        {
          on = ["f" "g"];
          run = "plugin fg";
          desc = "find file by content";
        }
        {
          on = ["f" "f"];
          run = "plugin fg --args='fzf'";
          desc = "find file by filename";
        }
        {
          on = ["f" "G"];
          run = "plugin fg --args='rg'";
          desc = "find file by content (ripgrep match)";
        }
        {
          on = ["C"];
          run = "plugin ouch --args=zip";
          desc = "Compress with ouch";
        }
      ];
    };
    settings = {
      opener.extract = [
        {
          run = "ouch d -y '$@'";
          desc = "Extract here with ouch";
          for = "unix";
        }
      ];
      plugin.append_previewers = [
        {
          name = "*";
          run = "hexyl";
        }
      ];
      plugin.prepend_fetchers = [
        {
          id = "git";
          name = "*";
          run = "git";
        }
        {
          id = "git";
          name = "*/";
          run = "git";
        }
        {
          id = "mime";
          name = "*";
          run = "mime-ext";
          prio = "high";
        }
      ];
      plugin.prepend_preloaders = [
        {
          mime = "{audio,video,image}/*";
          run = "mediainfo";
        }
        {
          mime = "application/subrip";
          run = "mediainfo";
        }
      ];
      plugin.prepend_previewers = [
        {
          name = "*/";
          run = "eza-preview";
        }
        {
          mime = "{audio,video,image}/*";
          run = "mediainfo";
        }
        {
          mime = "application/subrip";
          run = "mediainfo";
        }
        {
          name = "*.md";
          run = "glow";
        }
        {
          mime = "application/*zip";
          run = "ouch";
        }
        {
          mime = "application/x-tar";
          run = "ouch";
        }
        {
          mime = "application/x-bzip2";
          run = "ouch";
        }
        {
          mime = "application/x-7z-compressed";
          run = "ouch";
        }
        {
          mime = "application/x-rar";
          run = "ouch";
        }
        {
          mime = "application/x-xz";
          run = "ouch";
        }
      ];
    };
  };
}
