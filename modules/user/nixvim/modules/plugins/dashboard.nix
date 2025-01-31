let HOME = "";

in {
  programs.nixvim.plugins.dashboard.settings = {
    change_to_vcs_root = true;
    config = {
      project = { enable = false; };
      center = [
        {
          action = { __raw = "function(path) vim.cmd('Telescope find_files') end"; };
          desc = "Search files";
          group = "Label";
          icon = " ";
          key = "s";
        }
        {
          action = { __raw = "function(path) vim.cmd('Telescope file_browser') end"; };
          desc = "Explore file and folder";
          group = "explore";
          icon = " ";
          key = "e";
        }
        {
          action = { __raw = "function(path) vim.cmd('Telescope live_grep') end"; };
          desc = "Find text";
          group = "explore";
          icon = " ";
          key = "l";
        }
        {
          action = { __raw = "function(path) vim.cmd('Telescope oldfiles') end"; };
          desc = "Recent files";
          group = "explore";
          icon = " ";
          key = "r";
        }
        {
          action = { __raw = "function(path) vim.cmd('Telescope projects') end"; };
          desc = "List projects";
          group = "project";
          icon = " ";
          key = "x";
        }
        {
          action = {
            __raw =
              "function(path) vim.cmd('Telescope find_files cwd=/home/myamusashi/.config/home-manager/modules/user/nixvim') end";
          };
          desc = "Nixvim configuration";
          group = "config";
          icon = " ";
          key = "c";
        }
        {
          action = {
            __raw =
              "function(path) vim.cmd('Telescope find_files cwd=/home/myamusashi/.config/home-manager/modules/user/hypr') end";
          };
          desc = "Hyprland configuration";
          group = "config";
          icon = " ";
          key = "h";
        }
        {
          action = { __raw = "vim.cmd('qa')"; };
          desc = "Quit";
          group = "exit";
          icon = "󰩈 ";
          key = "q";
        }
      ];
      footer = [ "Fuck you man 🖕" ];
      header = [
        "MR PRESIDENT THERE IS SECOND PLANE COMINGGGGG"
        "        ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣤⣤⣤⣤"
        "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⣿⣿⣿⣿"
        "⠀⠀⠀⠀⠀⠀⠐⢦⡄⠀⠀⠀⠀⠀⠀⠀⠠⡀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿"
        "⠀⠀⠀⠀⠀⠀⠀⠀⢿⣤⠀⠀⠀⠀⠀⠀⠀⠂⠀⡀⠄⠀⠀⠀⠀⢸⣿⣿⣿⣿"
        "⠀⠀⠱⡆⣀⣀⣀⣀⣰⣿⣷⣀⡀⠀⠀⠀⡄⠀⠀⢠⠃⠀⠀⠀⠀⢸⣿⣿⣿⣿"
        "⠀⠀⢴⠋⠉⠉⠉⠉⣿⣿⠛⠈⠁⠈⠀⠀⠈⠂⠀⣴⡏⠀⠀⠀⠀⢸⣿⣿⣿⣿"
        "⠀⠀⠀⠀⠀⠀⠀⢸⣿⠘⠀⠀⠀⠀⠀⠀⣄⣠⢴⡹⡏⠀⠀⠀⠀⢸⣿⣿⣿⣿"
        "⠀⠀⠀⠀⠀⠀⠀⠀⠏⠀⠀⠀⠀⠀⠀⢀⣿⣿⡤⢿⡗⠀⠀⠀⠀⢸⣿⣿⣿⣿"
        "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡀⣤⡨⣡⣴⣿⣿⣷⣿⣏⢄⡐⠀⠀⣿⣿⣿⣿⣿"
        "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠀⡨⢥⡖⠱⢈⡏⣙⡉⣁⠠⠀⠀⠿⠿⠿⠿⠿"
        "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠈⠒⠀⠠⠂⠀⠀⠀⠀⠀⠀⠀⠀"
      ];
      week_header = { enable = true; };
    };
    theme = "doom";
  };
}
