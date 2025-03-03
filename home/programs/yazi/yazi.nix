{pkgs, ...}: let
  plugin = import ./plugins/package.nix {inherit pkgs;};
in {
  home.packages = with pkgs; [
    mediainfo
    ouch
    glow
    hexyl
    antiprism
    fzf
  ];
  programs.yazi = {
    enable = true;
    initLua = ./init.lua;
    flavors = {
      kanagawa = "${plugin.kanagawa}";
      material-ocean = "${plugin.material-ocean}";
    };
    theme.flavor = {
      dark = "kanagawa";
    };
    plugins = {
      chmod = "${plugin.official-plugins}/chmod.yazi";
      diff = "${plugin.official-plugins}/diff.yazi";
      full-border = "${plugin.official-plugins}/full-border.yazi";
      git = "${plugin.official-plugins}/git.yazi";
      hide-preview = "${plugin.official-plugins}/hide-preview.yazi";
      mount = "${plugin.official-plugins}/mount.yazi";
      rich-preview = "${plugin.rich-preview}";
      eza-preview = "${plugin.eza-preview}";
      mediainfo = "${plugin.mediainfo}";
      fg = "${plugin.fzf}";
      glow = "${plugin.glow}";
      hexyl = "${plugin.hexyl}";
      ouch = "${plugin.ouch}";
      yatline = "${plugin.yatline}";
      lazygit = "${plugin.lazygit}";
      githead = "${plugin.githead}";
    };
    keymap = {
      manager = {
        show_symlink = true;
        prepend_keymap = [
          {
            on = ["E"];
            run = "plugin eza-preview";
            desc = "Toggle tree/list dir preview";
          }

          {
            on = ["-"];
            run = "plugin eza-preview '--inc-level'";
            desc = "Increment tree level";
          }

          {
            on = ["_"];
            run = "plugin eza-preview '--dec-level'";
            desc = "Decrement tree level";
          }

          {
            on = ["$"];
            run = "plugin eza-preview '--toggle-follow-symlinks'";
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
            run = "plugin fg 'fzf'";
            desc = "find file by filename";
          }

          {
            on = ["f" "G"];
            run = "plugin fg 'rg'";
            desc = "find file by content (ripgrep match)";
          }

          {
            on = ["C"];
            run = "plugin ouch zip";
            desc = "Compress with ouch";
          }
        ];
      };
    };
    settings = {
      preview = {
        image_filter = "catmull-rom";
        image_quality = 80;
      };
      opener = {
        openImage = [
          {
            run = ''viewnior "$@" '';
            block = true;
            for = "unix";
          }
        ];
        extract = [
          {
            run = ''ouch d -y "$@" '';
            desc = "Extract here with ouch";
            for = "unix";
          }
        ];
      };

      open = {
        prepend_rules = [
          {
            name = "*.{svg,png,jpg,jpeg,gif}";
            use = "openImage";
          }
        ];
      };

      plugin = {
        prepend_fetchers = [
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
        ];
        prepend_preloaders = [
          {
            mime = "{audio,video,image}/*";
            run = "mediainfo";
          }

          {
            mime = "application/subrip";
            run = "mediainfo";
          }
        ];
        prepend_previewers = [
          {
            name = "*/";
            run = "eza-preview";
          }

          {
            mime = "{audio,video}/*";
            run = "mediainfo";
          }

          {
            name = "*.{jpg,png,webp}";
            run = "mediainfo";
          }

          {
            mime = "application/subrip";
            run = "mediainfo";
          }

          {
            name = "*.csv";
            run = "rich-preview";
          }

          {
            name = "*.md";
            run = "rich-preview";
          }

          {
            name = "*.rst";
            run = "rich-preview";
          }

          {
            name = "*.ipynb";
            run = "rich-preview";
          }

          {
            name = "*.json";
            run = "rich-preview";
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
            mime = "application/x-tar.gz";
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
  };
}
