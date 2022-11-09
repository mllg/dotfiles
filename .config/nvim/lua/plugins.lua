local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
    -- let packer handle itself
    use {
        'wbthomason/packer.nvim'
    }

    -- lua cache
    use {
        'lewis6991/impatient.nvim'
    }

    -- colorscheme
    use {
        "catppuccin/nvim",
        as = "catppuccin",
        config = function()
            require("catppuccin").setup {
                flavour = "macchiato" -- mocha, macchiato, frappe, latte
            }
            vim.api.nvim_command "colorscheme catppuccin"
        end
    }


    -- LSP
    use {
        'neovim/nvim-lspconfig',

        config = function()
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition)
            vim.keymap.set('n', 'gr', vim.lsp.buf.references)

            require('lspconfig').r_language_server.setup{}
        end
    }

    -- Treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        requires = {
            'nvim-treesitter/nvim-treesitter-textobjects',
            'nvim-treesitter/nvim-treesitter-refactor',
            'RRethy/nvim-treesitter-endwise',
        },

        config = function()
            require('nvim-treesitter.configs').setup {
                ensure_installed = {
                    'lua', 'r', 'c', 'cpp', 'bash', 'fish', 'sql', 'comment', 'markdown', 'markdown_inline', 'latex'
                },

                incremental_selection = {
                    enable = true,
                    keymaps = {
                        init_selection = ".",
                        node_incremental = ".",
                        scope_incremental = "",
                        node_decremental = "",
                    }
                },

                indent = {
                    enable = true
                },

                endwise = {
                    enable = true,
                },

                textobjects = {
                    select = {
                        enable = true,
                        lookahead = true,
                        keymaps = {
                            ['af'] = '@function.outer',
                            ['if'] = '@function.inner',
                            ['aa'] = '@parameter.outer',
                            ['ia'] = '@parameter.inner',
                            ['ic'] = '@conditional.inner',
                            ['ac'] = '@conditional.outer',
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

                refactor = {
                    smart_rename = {
                        enable = true,
                        keymaps = {
                            smart_rename = 'grr',
                        },
                    },
                },
            }
        end
    }

    -- Completion
    use {
        'hrsh7th/nvim-cmp',
        requires = {
            { 'L3MON4D3/LuaSnip', requires = 'rafamadriz/friendly-snippets' },
            { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' },
            { 'hrsh7th/cmp-path', after = 'nvim-cmp' },
            { 'hrsh7th/cmp-nvim-lsp', after = 'nvim-cmp' },
            { 'hrsh7th/cmp-calc', after = 'nvim-cmp' },
            { 'saadparwaiz1/cmp_luasnip', after = 'nvim-cmp' },
        },


        event = 'InsertEnter',

        config = function()
            local cmp = require('cmp')
            local luasnip = require('luasnip')
            require("luasnip.loaders.from_vscode").lazy_load()

            cmp.setup({
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },

                sources = cmp.config.sources({
                    { name = 'luasnip' },
                    { name = 'buffer' },
                    { name = 'path' },
                    { name = 'nvim_lsp' },
                    { name = 'calc' },
                }),

                mapping = cmp.mapping.preset.insert({
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<CR>'] = cmp.mapping.confirm {
                        behavior = cmp.ConfirmBehavior.Replace,
                        select = true,
                    },
                    ['<Tab>'] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        elseif luasnip.expand_or_jumpable() then
                            luasnip.expand_or_jump()
                        else
                            fallback()
                        end
                    end, { 'i', 's' }),
                    ['<S-Tab>'] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        elseif luasnip.jumpable(-1) then
                            luasnip.jump(-1)
                        else
                            fallback()
                        end
                    end, { 'i', 's' }),
                }),
            })
        end
    }

    -- Telescope
    use {
        'nvim-telescope/telescope.nvim',
        requires = {
            'nvim-lua/plenary.nvim',
            'kyazdani42/nvim-web-devicons',
            'ahmedkhalf/project.nvim',
            { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
        },

		config = function()
            require('project_nvim').setup {
                patterns = { '.projectroot', '.git', '.svn', 'Makefile', 'package.json', 'DESCRIPTION' }
            }

            require('telescope').load_extension('projects')
            require('telescope').load_extension('fzf')


            local map = vim.keymap.set
			map('n', '<leader>f', require('telescope.builtin').find_files)
			map('n', '<leader>g', require('telescope.builtin').live_grep)
			map('n', '<leader>b', require('telescope.builtin').buffers)
            map('n', '<leader>m', require('telescope.builtin').oldfiles)
			map('n', '<leader>n', require('telescope.builtin').resume)
			map('n', '<leader>t', require('telescope.builtin').treesitter)
			map('n', '<leader>y', require('telescope.builtin').registers)
			map('n', '<leader>l', require('telescope.builtin').lsp_workspace_symbols)
            map('n', '<leader>z', ':Telescope projects<cr>')
			-- map('n', '<leader>s', require('telescope.builtin').search_history)
			-- map('n', '<leader>t', require('telescope.builtin').git_branches)
		end
    }

    -- move lines up/down
    use {
        'matze/vim-move', -- move lines/selections quickly up and down
        as = 'move',
        config = function()
            vim.g.move_map_keys = 0
            local map = vim.keymap.set
            map('n', '<c-j>', '<Plug>MoveLineDown')
            map('n', '<c-k>', '<Plug>MoveLineUp')
            map('v', '<c-j>', '<Plug>MoveBlockDown')
            map('v', '<c-k>', '<Plug>MoveBlockUp')
        end
    }

    -- git markers
    use {
        'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup()
        end
    }

    -- git magit
    use {
        'TimUntersberger/neogit',
        opt = true,
        cmd = 'Neogit',
        config = function()
            local neogit = require('neogit')
            neogit.setup{}

            local map = vim.keymap.set
            map('n', '<f12>', '<cmd>Neogit<cr>')
        end
    }

    -- git conflict merge helper
    use {
        'akinsho/git-conflict.nvim',
        tag = "*",
        config = function()
            require('git-conflict').setup()
        end
    }


    -- EditorConfig Support
    use {
        'editorconfig/editorconfig-vim'
    }

    -- restore cursor position
    use {
        'ethanholz/nvim-lastplace',
        config = function()
            require('nvim-lastplace').setup {}
        end
    }



    -- Collection of mini plugins
    use { 'echasnovski/mini.nvim',
        requires = 'kyazdani42/nvim-web-devicons',

        config = function()
            local map = vim.keymap.set

            local bufremove = require('mini.bufremove')
            bufremove.setup{}
            map('n', '<leader>c', MiniBufremove.delete, { noremap = true})

            local cursorword = require('mini.cursorword')
            cursorword.setup{
                delay = 250
            }

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

            local indentscope = require('mini.indentscope')
            indentscope.setup{}
        end
    }

    use {
        'hkupty/iron.nvim',

        config = function()
            local iron = require('iron.core')
            local view = require('iron.view')

            iron.setup {
                config = {
                    scratch_repl = false,
                    repl_open_cmd = view.split.vertical.botright(0.35),
                    repl_definition = {
                        r = {
                            command = 'R'
                        }
                    },
                },
                keymaps = {
                    send_motion = "<space>r",
                    visual_send = "<cr>",
                    send_file = "<space>rf",
                    -- send_line = "<space>sl",
                    -- send_mark = "<space>rm",
                    -- mark_motion = "<space>mc",
                    -- mark_visual = "<space>mc",
                    -- remove_mark = "<space>md",
                    -- cr = "<space>r<cr>",
                    -- interrupt = "<space>s<space>",
                    -- exit = "<space>sq",
                },
            }
            local map = vim.keymap.set
            map('n', '<f10>', '<cmd>IronRepl<cr>')
            map('n', '<cr>', function()
                iron.send_line()

                local pos = vim.api.nvim_win_get_cursor(0)
                if (pos[1] < vim.fn.line('$')) then
                    vim.api.nvim_win_set_cursor(0, { pos[1] + 1, pos[2] })
                end
            end)
        end
    }

    -- file system browser + vidir
    use { 'elihunter173/dirbuf.nvim'
    }

    if packer_bootstrap then
        require('packer').sync()
    end
end)
