local M = {
    'nvim-telescope/telescope.nvim',

    dependencies = {
        'nvim-lua/plenary.nvim',
        'kyazdani42/nvim-web-devicons',
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
        'ahmedkhalf/project.nvim',
        -- 'nvim-telescope/telescope-z.nvim',
    },

    cmd = 'Telescope',

    keys = {
        { '<leader>f', '<cmd>Telescope find_files<cr>', desc = 'Find Files' },
        { '<leader>g', '<cmd>Telescope live_grep<cr>', desc = 'Grep Files' },
        { '<leader>b', '<cmd>Telescope buffers<cr>', desc = 'List Buffers' },
        { '<leader>m', '<cmd>Telescope oldfiles<cr>', desc = 'List MRU Files' },
        { '<leader>z', '<cmd>Telescope projects<cr>', desc = 'List Recent Projects' },
        { '<leader>n', '<cmd>Telescope resume<cr>', desc = 'Resume Telescope' },
        { '<leader>t', '<cmd>Telescope treesitter<cr>', desc = 'Treesitter Symbols' },
        { '<leader>y', '<cmd>Telescope yank_history<cr>', desc = 'Yanks' },
        { '<leader>ls', '<cmd>Telescope lsp_workspace_symbols<cr>', desc = 'LSP Workspace Symbols' },
    },

    config = function()
        local telescope = require('telescope')
        telescope.load_extension('fzf')
        telescope.load_extension('yank_history')
        telescope.load_extension('projects')
    end,
}

return M
