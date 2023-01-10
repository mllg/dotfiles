-- Automatically source and re-compile packer whenever you save this init.lua
local group

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


-- check for changes and reload
group = vim.api.nvim_create_augroup('CheckTime', { clear = true })
vim.api.nvim_create_autocmd({ "FocusGained", "TermClose", "TermLeave" }, {
    group = group,
    command = 'checktime'
})
