vim.bo.filetype = 'markdown'

local opt = vim.opt_local
opt.tabstop = 4
opt.shiftwidth = 4
opt.spell = true
opt.spelllang = 'en'

vim.cmd [[ runtime! ftplugin/r/commands.lua ]]
