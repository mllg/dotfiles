local M = {
    { 'echasnovski/mini.nvim',
    dependencies = 'kyazdani42/nvim-web-devicons',

    config = function()
        local align = require('mini.align')
        align.setup({
            mappings = {
                start = '',
                start_with_preview = 'ga'
            }
        })

        local basics = require('mini.basics')
        basics.setup{
            options = {
                extra_ui = false,
            },
            mappings = {
                basic = true,
                option_toggle_prefix = '',
                windows = true,
            },
            autocommands = {
                basic = false,
                relnum_in_visual_mode = true,
            }
        }

        local bufremove = require('mini.bufremove')
        bufremove.setup{}
        vim.keymap.set('n', '<backspace>', function()
            bufremove.delete(0, false)
        end, { noremap = true })


        local comment = require('mini.comment')
        comment.setup{
            mappings = {
                comment = 'gc',
                comment_line = 'gcc',
                textobject = 'gc',
            },

            hooks = {
                pre = function()
                    require('ts_context_commentstring.internal').update_commentstring()
                end,
            },
        }

        local jump = require('mini.jump')
        jump.setup{}

        local misc = require('mini.misc')
        misc.setup{}
        misc.setup_auto_root({ '.projectroot', '.git', '.svn', 'Makefile', 'DESCRIPTION' })
        misc.setup_restore_cursor()

        local move = require('mini.move')
        move.setup{}

        local statusline = require('mini.statusline')
        statusline.setup{
            set_vim_settings = false,
            use_icons = true
        }

        local surround = require('mini.surround')
        surround.setup{}

        local tabline = require('mini.tabline')
        tabline.setup{
            show_icons = true
        }

        local trailspace = require('mini.trailspace')
        trailspace.setup{}
    end,
}}

return M
