local M = {
    'Wansmer/sibling-swap.nvim',

    keys = {
        { '<space>,', function() require('sibling-swap').swap_with_left() end },
        { '<space>.', function() require('sibling-swap').swap_with_right() end },
    },

    config = function()
        require('sibling-swap').setup({
            use_default_keys = false,
        })
    end,
}

return M
