{
  programs.nixvim = {
    extraFiles = {
      "lua/config/neovide.lua".text = ''
        if vim.g.neovide then
            vim.o.guifont = "CaskaydiaMono Nerd Font:h12"
            vim.g.neovide_transparency = 0.8
            vim.g.neovide_hide_mouse_when_typing = true
            vim.opt.number = true
            vim.opt.cmdheight = 1
            vim.opt.relativenumber = true

            -- Keymappings
            local opts = { noremap = true, silent = true }
            vim.api.nvim_set_keymap("n", "<C-S-v>", '"+p', opts)
            vim.api.nvim_set_keymap("v", "<C-S-v>", '"+p', opts)
            vim.api.nvim_set_keymap("i", "<C-S-v>", '<Esc>"+pa', opts)
            vim.api.nvim_set_keymap("c", "<C-S-v>", [[<C-\>e getcmdline()<CR>]], opts)
            vim.api.nvim_set_keymap("c", "<C-S-v>", "<C-R>+", opts)
            vim.api.nvim_set_keymap("n", "<C-S-v>", ":let @+ = @/<CR>", opts)
            vim.api.nvim_set_keymap("c", "<C-S-v>", "<C-r>+", opts)
            vim.api.nvim_set_keymap("n", "<C-S-mf>", ":Telescope file_browser<CR>", opts)

            -- Animation
            vim.g.neovide_cursor_animate_in_insert_mode = true
            vim.g.neovide_cursor_animate_command_line = true
            vim.g.neovide_position_animation_length = 0.10
            vim.g.neovide_scroll_animation_length = 0.15
            vim.g.neovide_cursor_animation_length = 0.08
            vim.g.neovide_cursor_trail_size = 0.4
            vim.g.neovide_cursor_antialiasing = false
            vim.g.neovide_cursor_vfx_mode = "pixiedust"

            -- Scale
            vim.g.neovide_scale_factor = 1.0
            local change_scale_factor = function(delta)
                vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * delta
            end
            vim.keymap.set("n", "<C-+>", function()
                change_scale_factor(1.25)
            end)
            vim.keymap.set("n", "<C-_>", function()
                change_scale_factor(1 / 1.25)
            end)
        end
      '';
    };
  };
}
