{
  programs.nixvim = {
    extraFiles = {
      "lua/config/keymaps.lua".text = ''
        local map = vim.keymap.set

        map({ "n", "i" }, "<C-i>", "<cmd>IconPickerNormal<cr>", { noremap = true, silent = true })
        map({ "n", "v" }, "<leader>;", "<cmd>Dashboard<cr>", { desc = "Dashboard", noremap = true, silent = true })
        map({ "n", "v" }, "<C-S-h>", "<Plug>GoNSMLeft", { noremap = true, silent = true })
        map({ "n", "v" }, "<C-S-j>", "<Plug>GoNSMDown", { noremap = true, silent = true })
        map({ "n", "v" }, "<C-S-k>", "<Plug>GoNSMUp", { noremap = true, silent = true })
        map({ "n", "v" }, "<C-S-l>", "<Plug>GoNSMRight", { noremap = true, silent = true })
        map({ "n", "v", "i" }, "<leader>d", "<cmd>lua vim.diagnostic.open_float()<cr>", { noremap = true, silent = true })

        -- better up/down
        map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
        map({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
        map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })
        map({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })

        -- Move to window using the <ctrl> hjkl keys
        map("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window", remap = true })
        map("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
        map("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
        map("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window", remap = true })

        -- Resize window using <ctrl> arrow keys
        map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
        map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
        map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
        map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })

        -- Move Lines
        map("n", "<A-j>", "<cmd>execute 'move .+' . v:count1<cr>==", { desc = "Move Down" })
        map("n", "<A-k>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = "Move Up" })
        map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
        map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
        map("v", "<A-j>", ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = "Move Down" })
        map("v", "<A-k>", ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = "Move Up" })

        -- buffers
        map("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
        map("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next Buffer" })
        map("n", "[b", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
        map("n", "]b", "<cmd>bnext<cr>", { desc = "Next Buffer" })
        map("n", "<leader>bb", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
        map("n", "<leader>`", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
        map("n", "<leader>bD", "<cmd>:bd<cr>", { desc = "Delete Buffer and Window" })

        -- taken from runtime/lua/_editor.lua
        map(
          "n",
          "<leader>ur",
          "<Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>",
          { desc = "Redraw / Clear hlsearch / Diff Update" }
        )

        -- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
        map("n", "n", "'Nn'[v:searchforward].'zv'", { expr = true, desc = "Next Search Result" })
        map("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" })
        map("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" })
        map("n", "N", "'nN'[v:searchforward].'zv'", { expr = true, desc = "Prev Search Result" })
        map("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev Search Result" })
        map("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev Search Result" })

        -- Add undo break-points
        map("i", ",", ",<c-g>u")
        map("i", ".", ".<c-g>u")
        map("i", ";", ";<c-g>u")

        -- save file
        map({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save File" })

        --keywordprg
        map("n", "<leader>K", "<cmd>norm! K<cr>", { desc = "Keywordprg" })

        -- better indenting
        map("v", "<", "<gv")
        map("v", ">", ">gv")

        -- commenting
        map("n", "gco", "o<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "Add Comment Below" })
        map("n", "gcO", "O<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "Add Comment Above" })


        -- new file
        map("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New File" })

        map("n", "<leader>xl", "<cmd>lopen<cr>", { desc = "Location List" })
        map("n", "<leader>xq", "<cmd>copen<cr>", { desc = "Quickfix List" })

        map("n", "[q", vim.cmd.cprev, { desc = "Previous Quickfix" })
        map("n", "]q", vim.cmd.cnext, { desc = "Next Quickfix" })

        -- diagnostic
        local diagnostic_goto = function(next, severity)
          local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
          severity = severity and vim.diagnostic.severity[severity] or nil
          return function()
            go({ severity = severity })
          end
        end
        map("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Line Diagnostics" })
        map("n", "]d", diagnostic_goto(true), { desc = "Next Diagnostic" })
        map("n", "[d", diagnostic_goto(false), { desc = "Prev Diagnostic" })
        map("n", "]e", diagnostic_goto(true, "ERROR"), { desc = "Next Error" })
        map("n", "[e", diagnostic_goto(false, "ERROR"), { desc = "Prev Error" })
        map("n", "]w", diagnostic_goto(true, "WARN"), { desc = "Next Warning" })
        map("n", "[w", diagnostic_goto(false, "WARN"), { desc = "Prev Warning" })
      '';
    };
  };

  programs.nixvim.plugins.which-key.settings = {
    delay = 200;
    expand = 1;
    notify = false;
    preset = false;
    replace = {
      desc = [
        ["<space>" "SPACE"]
        ["<leader>" "SPACE"]
        ["<[cC][rR]>" "RETURN"]
        ["<[tT][aA][bB]>" "TAB"]
        ["<[bB][sS]>" "BACKSPACE"]
      ];
    };
    spec = [
      {
        __unkeyed-1 = "<leader>t";
        __unkeyed-2 = "<cmd>FloatermNew --height=0.8 --width=0.8 --wintype=float<cr>";
        group = "Terminal";
        icon = " ";
      }
      {
        __unkeyed-1 = "<leader>e";
        __unkeyed-2 = "<cmd>Neotree toggle float filesystem<cr>";
        group = "Explore";
        icon = " ";
      }
      {
        __unkeyed-1 = [
          {
            __unkeyed-1 = "<leader>f";
            group = "Normal Visual Group";
          }
          {
            __unkeyed-1 = "<leader>f<tab>";
            group = "Normal Visual Group in Group";
          }
        ];
        mode = ["n" "v"];
      }
      {
        __unkeyed-1 = "<leader>w";
        group = "windows";
        proxy = "<C-w>";
      }
      {
        __unkeyed-1 = "<leader>cS";
        __unkeyed-2 = "<cmd>CodeSnapSave<CR>";
        desc = "Save";
        mode = "v";
      }
    ];
    win = {border = "single";};
  };
}
