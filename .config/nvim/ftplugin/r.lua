opt = vim.opt_local
opt.tabstop = 2
opt.shiftwidth = 2
opt.spell = true
opt.spelllang = 'en'

local function iron_send(str)
    local iron = require('iron.core')
    iron.send('r', { str })
end

local function r_send(str)
    return function(opts)
        iron_send(str)
    end
end

vim.api.nvim_create_user_command('RLoadPackage',
    r_send('devtools::load_all()'),
    { nargs = 0 }
)

vim.api.nvim_create_user_command('RCheckPackage',
    r_send('devtools::check()'),
    { nargs = 0 }
)

vim.api.nvim_create_user_command('RTestPackage',
    r_send('devtools::test()'),
    { nargs = 0 }
)

vim.api.nvim_create_user_command('RDocumentPackage',
    r_send('devtools::document()'),
    { nargs = 0 }
)

vim.api.nvim_create_user_command('RMake',
    r_send('devtools::document(); devtools::install()'),
    { nargs = 0 }
)

vim.api.nvim_create_user_command('RHelp',
    function(opts)
        iron_send('help("' .. opts.args .. '")')
    end,
    { nargs = 1 }
)

local map = vim.keymap.set
map('n', '<leader>rh',
    function()
        local iron = require('iron.core')
        iron.send('r', { 'help("' .. vim.fn.expand('<cword>') .. '")' })
    end,
    { noremap = true}
)
