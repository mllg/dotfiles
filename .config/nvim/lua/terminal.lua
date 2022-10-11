local map = vim.keymap.set
map('t', '<Esc>', '<c-\\><c-n>', { noremap = true})

local group = vim.api.nvim_create_augroup("terminal_opts", { clear = true })
vim.api.nvim_create_autocmd('TermOpen', {
    group = group,
    callback = function()
        vim.opt.buflisted = false
        vim.opt_local.scrollback = 10000
        vim.opt_local.signcolumn = 'no'
        vim.opt_local.number = false

        local opts = { buffer = true, noremap = true }
        map('n', '<c-h>', '<Nop>', opts)
        map('n', '<c-l>', '<Nop>', opts)
        map('n', '<c-c>', 'i<c-c>', opts)
    end
})
