local M = {
    {
        'catppuccin/nvim',
        lazy = false,
        name = 'catppuccin',
        priority = 1000,
        config = function()
            vim.cmd.colorscheme "catppuccin-mocha"
        end
    },

    {
        'folke/tokyonight.nvim',
        lazy = true
    }
}

return M
