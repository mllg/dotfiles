-- Clone 'mini.nvim' manually in a way that it gets managed by 'mini.deps'
local path_package = vim.fn.stdpath('data') .. '/site/'
local mini_path = path_package .. 'pack/deps/start/mini.nvim'

if not vim.loop.fs_stat(mini_path) then
    vim.cmd('echo "Installing `mini.nvim`" | redraw')
    local clone_cmd = {
        'git', 'clone', '--filter=blob:none',
        'https://github.com/echasnovski/mini.nvim', mini_path
    }
    vim.fn.system(clone_cmd)
    vim.cmd('packadd mini.nvim | helptags ALL')
    vim.cmd('echo "Installed `mini.nvim`" | redraw')
end

-- leader and localleader
vim.g.mapleader = " "
vim.g.maplocalleader = "ß"


-- Set up 'mini.deps' (customize to your liking)
require('mini.deps').setup({ path = { package = path_package } })
local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later
local map = vim.keymap.set

-- Better presets
now(function()
    require('mini.basics').setup({
        options = {
            extra_ui = true,
        },
        mappings = {
            -- Window navigation with <C-hjkl>, resize with <C-arrow>
            windows = true,
            -- Move cursor in Insert, Command, and Terminal mode with <M-hjkl>
            move_with_alt = true,
        },
        autocommands = {
            -- Set 'relativenumber' only in linewise and blockwise Visual mode
            relnum_in_visual_mode = true
        },

    })
end)

-- UI
now(function()
    vim.o.termguicolors = true
    vim.cmd('colorscheme minischeme')
    require('mini.notify').setup()
    vim.notify = require('mini.notify').make_notify()

    add('nvim-tree/nvim-web-devicons')
    require('nvim-web-devicons').setup()

    require('mini.tabline').setup()
    require('mini.statusline').setup()
end)

-- TS
now(function()
    add({
        source = 'nvim-treesitter/nvim-treesitter',
        hooks = { post_checkout = function() vim.cmd('TSUpdate') end },
    })
    require('nvim-treesitter.configs').setup({
        ensure_installed = { "lua", "vimdoc", "vim", "json", "markdown", "markdown_inline", "c", "cpp", "r", "rnoweb", "fish", "latex", "bibtex",
            "html", "css", "javascript", "php", "make", "gitcommit", "gitignore", },
        indent = {
            enable = true,
        }
    })
end)

now(function()
    add('stevearc/oil.nvim')
    require('oil').setup()
    map("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
end)

-- Edit helpers
later(function()
    require('mini.ai').setup()
    require('mini.align').setup()
    require('mini.comment').setup()
    require('mini.cursorword').setup()
    require('mini.git').setup()
    require('mini.diff').setup()
    require('mini.surround').setup()
    require('mini.move').setup()
    require('mini.operators').setup()
    require('mini.pairs').setup()
    require('mini.splitjoin').setup()
end)

later(function()
    require('mini.pick').setup()

    map('n', '<leader>f', function() MiniPick.builtin.files({ tool = 'rg' }) end)
    map('n', '<leader>b', function() MiniPick.builtin.buffers() end)
    map('n', '<leader>g', function() MiniPick.builtin.grep_live({ tool = 'rg' }) end)
    map('n', '<leader>r', function() MiniPick.builtin.resume() end)
end)

later(function()
    require('mini.fuzzy').setup()
    require('mini.visits').setup()
end)
