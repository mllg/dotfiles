local M = {
    'fedepujol/move.nvim',

    cmd = { 'MoveLine', 'MoveHChar', 'MoveBlock', 'MoveHBlock' },

    init = function()
        local opts = { noremap = true, silent = true }
        -- Normal-mode commands
        vim.keymap.set('n', '<a-j>', ':MoveLine(1)<CR>', opts)
        vim.keymap.set('n', '<a-k>', ':MoveLine(-1)<CR>', opts)
        vim.keymap.set('n', '<a-h>', ':MoveHChar(-1)<CR>', opts)
        vim.keymap.set('n', '<a-l>', ':MoveHChar(1)<CR>', opts)

        -- Visual-mode commands
        vim.keymap.set('v', '<a-j>', ':MoveBlock(1)<CR>', opts)
        vim.keymap.set('v', '<a-k>', ':MoveBlock(-1)<CR>', opts)
        vim.keymap.set('v', '<a-h>', ':MoveHBlock(-1)<CR>', opts)
        vim.keymap.set('v', '<a-l>', ':MoveHBlock(1)<CR>', opts)
    end
}

return M
