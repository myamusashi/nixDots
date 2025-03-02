{
  programs.nixvim.extraFiles."lua/config/core.lua".text = ''
    vim.g.do_filetype_lua = 1

    vim.filetype.add({
        extension = {
            conf = "conf",
            config = "conf",
            md = "markdown",
            lua = "lua",
            sh = "sh",
            zsh = "sh",
            h = function(path, bufnr)
                if vim.fn.search("\\C^#include <[^>.]\\+>$", "nw") ~= 0 then
                    return "cpp"
                end
                return "c"
            end,
        },

        pattern = {
            ["^\\.(?:zsh(?:rc|env)?)$"] = "sh",
        },

        filename = {
            ["TODO"] = "markdown",
            [".git/config"] = "gitconfig",
            -- ["~/.dotfiles/zsh/.zshrc"] = "sh",
            -- ["~/.zshrc"] = "sh",
            -- [ "~/.config/mutt/muttrc"] = "muttrc",
            ["README$"] = function(path, bufnr)
                if string.find("#", vim.api.nvim_buf_get_lines(bufnr, 0, 1, true)) then
                    return "markdown"
                end
                -- no return means the filetype won't be set and to try the next method
            end,
        },
    })
  '';
}
