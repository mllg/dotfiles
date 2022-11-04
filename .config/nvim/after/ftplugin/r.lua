opt = vim.opt_local
opt.tabstop = 2
opt.shiftwidth = 2
opt.spell = true
opt.spelllang = 'en'


vim.api.nvim_create_user_command('RLoadPackage',
    function()
        local iron = require('iron.core')
        iron.send('r', { 'devtools::load_all()' })
    end,
    { nargs = 0 }
)

vim.api.nvim_create_user_command('RHelp',
    function(opts)
        local iron = require('iron.core')
        iron.send('r', { 'help("' .. opts.args .. '")' })
    end,
    { nargs = 1 }
)

