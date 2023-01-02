-- Automatically source and re-compile packer whenever you save this init.lua
local group

group = vim.api.nvim_create_augroup('TerminalTweaks', { clear = true })
vim.api.nvim_create_autocmd('TermOpen', {
    group = group,
    callback = function()
        vim.opt.buflisted = false
        vim.opt_local.scrollback = 10000
        vim.opt_local.signcolumn = 'no'
        vim.opt_local.number = false

        local map = vim.keymap.set
        local opts = { buffer = true, noremap = true }
        map('n', '<c-h>', '<Nop>', opts)
        map('n', '<c-l>', '<Nop>', opts)
        map('n', '<c-c>', 'i<c-c>', opts)
    end
})

-- show cursor line only in active window
group = vim.api.nvim_create_augroup('DisableCursorLine', { clear = true })
vim.api.nvim_create_autocmd({ 'InsertLeave', 'WinEnter' }, {
    group = group,
    callback = function()
        local ok, cl = pcall(vim.api.nvim_win_get_var, 0, 'auto-cursorline')
        if ok and cl then
            vim.wo.cursorline = true
            vim.api.nvim_win_del_var(0, 'auto-cursorline')
        end
    end,
})
group = vim.api.nvim_create_augroup('EnableCursorLine', { clear = true })
vim.api.nvim_create_autocmd({ 'InsertEnter', 'WinLeave' }, {
    group = group,
    callback = function()
        local cl = vim.wo.cursorline
        if cl then
            vim.api.nvim_win_set_var(0, 'auto-cursorline', cl)
            vim.wo.cursorline = false
        end
    end,
})


-- use markdown syntax for quarto
group = vim.api.nvim_create_augroup('QuartoFileType', { clear = true })
vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
    group = group,
    pattern = '*.qmd',
    callback = function()
        vim.bo.filetype = 'markdown'
    end,
})
