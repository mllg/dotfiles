local M = {
    'fedepujol/move.nvim',

    keys = {
        { '<a-j>', function() require('move').MoveLine(1) end },
        { '<a-k>', function() require('move').MoveLine(-1) end },
        { '<a-h>', function() require('move').MoveHChar(-1) end },
        { '<a-l>', function() require('move').MoveHChar(1) end },

        { '<a-j>', function() require('move').MoveBlock(1) end, mode = 'v' },
        { '<a-k>', function() require('move').MoveBlock(-1) end, mode = 'v' },
        { '<a-h>', function() require('move').MoveHBlock(-1) end, mode = 'v' },
        { '<a-l>', function() require('move').MoveHBlocl(1) end, mode = 'v' },
    },
}

return M
