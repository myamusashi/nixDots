{
  programs.nixvim.plugins.lualine.settings = {
    options = {
      theme = "auto";
      disabled_filetypes = {
        __unkeyed-1 = "startify";
        __unkeyed-2 = "neo-tree";
        statusline = ["dap-repl"];
        winbar = ["aerial" "dap-repl" "neotest-summary"];
      };
      globalstatus = true;
      always_divide_middle = true;
      always_show_tabline = true;
      refresh = {
        statusline = 100;
        tabline = 100;
        winbar = 100;
      };
      component_separators = {
        left = "";
        right = "";
      };
      section_separators = {
        left = "";
        right = "";
      };
    };
    sections = {
      lualine_a = ["mode"];
      lualine_b = ["branch" "diff" "diagnostic"];
      lualine_c = [];
      lualine_x = [
        "searchcount"
        "filetype"
        {
          __unkeyed-1 = {
            __raw = ''
              function()
                 local filetype = vim.bo.filetype
                 return formatters[filetype] or ""
              end,
            '';
          };
        }
        "progress"
      ];
      lualine_y = ["location"];
      lualine_z = ["filename"];
    };
  };
}
