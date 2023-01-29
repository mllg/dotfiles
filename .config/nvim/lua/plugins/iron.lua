local M = {
    'hkupty/iron.nvim',

    ft = { 'r', 'rmd', 'quarto', 'julia' },

    keys = {
        { '<f10>', '<cmd>IronRepl<cr>' }
    },

    config = function()
        local iron = require('iron.core')
        local bracketed_paste = require("iron.fts.common").bracketed_paste
        local r_repl = {
            command = { 'radian', '--no-save' },
            format = bracketed_paste
        },

        iron.setup {
            config = {
                scratch_repl = false,
                scope = require('iron.scope').singleton,
                repl_open_cmd = require('iron.view').split.vertical.botright(0.35),

                repl_definition = {
                    r = r_repl,
                    quarto = r_repl,
                    markdown = r_repl,
                    lua = {
                        command = { 'luajit' },
                    },
                },
            },
            keymaps = {
                send_motion = '<localleader>r',
                visual_send = '<localleader><localleader>',
                send_file = '<localleader>rf',
                -- send_line = '<space>sl',
                -- send_mark = '<space>rm',
                -- mark_motion = '<space>mc',
                -- mark_visual = '<space>mc',
                -- remove_mark = '<space>md',
                -- cr = '<space>r<cr>',
                -- interrupt = '<space>s<space>',
                -- exit = '<localleader>rq',
            },
        }
        vim.keymap.set('n', '<localleader><localleader>', function()
            iron.send_line()

            local pos = vim.api.nvim_win_get_cursor(0)
            if (pos[1] < vim.api.nvim_buf_line_count(0)) then
                vim.api.nvim_win_set_cursor(0, { pos[1] + 1, pos[2] })
            end
        end, { noremap = true })
    end
}

return M
