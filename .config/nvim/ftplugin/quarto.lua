local opt = vim.opt_local
opt.tabstop = 4
opt.shiftwidth = 4
opt.spell = true
opt.spelllang = 'en'
opt.conceallevel = 0

vim.cmd [[ runtime! ftplugin/r.lua ]]
