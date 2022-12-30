local M = { 'echasnovski/mini.nvim',
    dependencies = 'kyazdani42/nvim-web-devicons',

    config = function()
        local bufremove = require('mini.bufremove')
        bufremove.setup{}
        vim.keymap.set('n', '<leader>c', MiniBufremove.delete, { noremap = true})

        local jump = require('mini.jump')
        jump.setup{}

        local surround = require('mini.surround')
        surround.setup{}

        local comment = require('mini.comment')
        comment.setup{
            mappings = {
                comment = 'gc',
                comment_line = 'gcc',
                textobject = 'gc',
            },
        }

        local statusline = require('mini.statusline')
        statusline.setup{
            set_vim_settings = false,
            use_icons = true
        }

        local tabline = require('mini.tabline')
        tabline.setup{
            show_icons = true
        }

        local trailspace = require('mini.trailspace')
        trailspace.setup{}
    end
}

return M
