local map = vim.keymap.set
map('t', '<Esc>', '<c-\\><c-n>', { noremap = true })

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
