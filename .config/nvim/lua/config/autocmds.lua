-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
local group

group = vim.api.nvim_create_augroup('TerminalTweaks', { clear = true })
vim.api.nvim_create_autocmd('TermOpen', {
    group = group,
    callback = function()
        vim.opt.buflisted = false
        vim.opt_local.scrollback = 10000
        vim.opt_local.signcolumn = 'no'
        vim.opt_local.number = false
        vim.keymap.set('n', '<c-c>', 'i<c-c>', { buffer = true, noremap = true })
    end
})
