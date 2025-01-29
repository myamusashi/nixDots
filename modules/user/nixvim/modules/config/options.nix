{
  programs.nixvim = {
    extraFiles = {
      "ftplugin/options.lua".text = ''
        vim.opt.tabstop = 4
        vim.opt.shiftwidth = 4
        vim.opt.expandtab = true
        vim.opt.number = true
        vim.opt.relativenumber = true
        vim.opt.cmdheight = 1
        vim.opt.scrolloff = 0
        vim.opt.termguicolors = true
        vim.opt.list = true
        vim.opt.autowrite = false
        vim.opt.clipboard = vim.env.SSH_TTY and "" or "unnamedplus"

        -- Editor
        vim.opt.wrap = true
        vim.opt.linebreak = true

        -- Indentation
        vim.opt.expandtab = true
        vim.opt.smartindent = true
        vim.opt.shiftwidth = 4
        vim.opt.tabstop = 4
        vim.opt.softtabstop = 4

        -- Split
        vim.opt.splitbelow = true

        -- Folding
        vim.opt.foldenable = true
        vim.opt.foldmethod = "manual"
        vim.opt.foldcolumn = "1"
        vim.opt.foldlevel = 99
        vim.opt.foldlevelstart = 99
        '';
    };
  };
}
