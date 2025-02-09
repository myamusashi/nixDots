{
  programs.fastfetch = {
    enable = true;
    settings = {
      logo = {
        type = "kitty";
        source = "~/.face";
        padding = {
          right = 0;
          top = 0;
        };
        width = 25;
        height = 12;
      };
      general = {
        multithreading = true;
        dsForceDrm = true;
      };
      display = {
        separator = " ➜ ";
      };
      modules = [
        {
          type = "title";
          format = "                                 {6}{7}{8}";
        }
        {
          key = "     OS         ";
          keyColor = "white";
          type = "os";
        }
        {
          key = "    󰌢 Machine    ";
          keyColor = "white";
          type = "host";
        }
        {
          key = "     Kernel     ";
          keyColor = "white";
          type = "kernel";
        }
        {
          key = "     InitSys    ";
          keyColor = "white";
          type = "initsystem";
        }
        {
          key = "    󰅐 Uptime     ";
          keyColor = "blue";
          type = "uptime";
        }
        {
          key = "     WM         ";
          keyColor = "blue";
          type = "wm";
        }
        {
          key = "     Font       ";
          keyColor = "blue";
          type = "terminalfont";
        }
        {
          key = "     Packages   ";
          keyColor = "cyan";
          type = "packages";
        }
        {
          key = "     Theme      ";
          keyColor = "cyan";
          type = "theme";
        }
        {
          key = "     Terminal   ";
          keyColor = "cyan";
          type = "terminal";
        }
        {
          key = "    󱁋 Disk       ";
          keyColor = "cyan";
          type = "Disk";
        }
      ];
    };
  };
}
