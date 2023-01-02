local M = {
    'gbprod/yanky.nvim',
    config = true,
    init = function()
        local map = vim.keymap.set
        map({'n','x'}, 'p', '<Plug>(YankyPutAfter)')
        map({'n','x'}, 'P', '<Plug>(YankyPutBefore)')
        map({'n','x'}, 'gp', '<Plug>(YankyGPutAfter)')
        map({'n','x'}, 'gP', '<Plug>(YankyGPutBefore)')
        map('n', '=p', '<Plug>(YankyPutAfterFilter)')
        map('n', '=P', '<Plug>(YankyPutBeforeFilter)')
    end
}

return M
