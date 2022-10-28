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
        'neovim/nvim-lspconfig'
    }

    -- Treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        requires = 'nvim-treesitter/nvim-treesitter-textobjects',

        config = function()
            require('nvim-treesitter.configs').setup {
                ensure_installed = { 'lua', 'r', 'c', 'cpp', 'bash', 'fish', 'sql', 'comment' },
                indent = {
                    enable = true
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
            }
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
        config = function()
            local neogit = require('neogit')
            neogit.setup{}
        end
    }

    -- extension manager
    use {
        'wbthomason/packer.nvim'
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


    if packer_bootstrap then
        require('packer').sync()
    end
end)
