local M = {
    'nvim-treesitter/nvim-treesitter',

    dependencies = {
        'nvim-treesitter/nvim-treesitter-textobjects',
        'RRethy/nvim-treesitter-endwise',
        'nvim-treesitter/nvim-treesitter-refactor',
        'JoosepAlviste/nvim-ts-context-commentstring',
    },

    build = function()
        pcall(require('nvim-treesitter.install').update { with_sync = true })
    end,

    config = function()
        require('nvim-treesitter.configs').setup {
            ensure_installed = {
                'lua', 'r', 'c', 'cpp', 'vim', 'markdown', 'markdown_inline', 'fish', 'julia', 'python',
                'latex', 'bibtex',
                'json', 'toml', 'yaml',
                'gitcommit', 'gitignore',
                'html', 'css', 'javascript',
                'comment', 'help',
            },

            highlight = {
                enable = true,
            },

            indent = {
                enable = true
            },

            endwise = {
                enable = true,
            },

            refactor = {
                highlight_definitions = {
                    enable = true,
                    clear_on_cursor_move = true,
                },
                smart_rename = {
                    enable = true,
                    keymaps = {
                        smart_rename = 'grr',
                    },
                },
            },

            textobjects = {
                select = {
                    enable = true,
                    lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
                    keymaps = {
                        -- You can use the capture groups defined in textobjects.scm
                        ['aa'] = '@parameter.outer',
                        ['ia'] = '@parameter.inner',
                        ['af'] = '@function.outer',
                        ['if'] = '@function.inner',
                        ['ac'] = '@class.outer',
                        ['ic'] = '@class.inner',
                    },
                },
                swap = {
                    enable = true,
                    swap_next = {
                        ['<leader>a'] = '@parameter.inner',
                    },
                    swap_previous = {
                        ['<leader>A'] = '@parameter.inner',
                    },
                },
            },

            context_commentstring = {
                enable = true,
                enable_autocmd = false,
            }
        }
    end,
}

return M
