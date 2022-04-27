-- Bootstrap packer.nvim
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.api.nvim_command 'packadd packer.nvim'
end

-- Plugins
require('packer').startup(function()
    -- packer manages itself
    use { 'wbthomason/packer.nvim' }

    -- bytecode cache
    use 'lewis6991/impatient.nvim'

    -- file navigation
    use { 'nvim-telescope/telescope.nvim', -- fuzzy finder
        requires = { 'nvim-lua/popup.nvim', 'nvim-lua/plenary.nvim' },
		config = function()
            local map = vim.keymap.set
			map('n', '<A-f>', require('telescope.builtin').find_files)
			map('n', '<A-g>', require('telescope.builtin').live_grep)
			map('n', '<A-b>', require('telescope.builtin').buffers)
		    map('n', '<A-s>', require('telescope.builtin').search_history)
			map('n', '<A-t>', require('telescope.builtin').git_branches)
			map('n', '<A-y>', require('telescope.builtin').registers)
			map('n', '<A-n>', require('telescope.builtin').resume)
			map('n', '<A-l>', require('telescope.builtin').lsp_workspace_symbols)
		end
    }

    use { 'nvim-telescope/telescope-fzf-native.nvim',
        requires =  { 'nvim-telescope/telescope.nvim' },
        run = 'make',
        config = function()
            require('telescope').load_extension('fzf')
        end
    }

    use { 'nvim-telescope/telescope-github.nvim',
        requires =  { 'nvim-telescope/telescope.nvim' },
        config = function()
            require('telescope').load_extension('gh')
			vim.keymap.set('n', '<A-i>', ':Telescope gh issues<cr>')
			vim.keymap.set('n', '<A-p>', ':Telescope gh pull_request<cr>')
        end
    }

    use { 'mllg/telescope-rhistory.nvim',
        requires =  { 'nvim-telescope/telescope.nvim' },
        config = function()
            require('telescope').load_extension('rhistory')
			vim.keymap.set('n', '<A-h>', ':Telescope rhistory<cr>')
        end
    }

    use { 'ahmedkhalf/project.nvim',
        requires =  { 'nvim-telescope/telescope.nvim' },
        config = function()
            require('project_nvim').setup {
                patterns = { '.projectroot', '.git', '.svn', 'Makefile', 'package.json', 'DESCRIPTION', 'init.lua' }
            }
            require('telescope').load_extension('projects')
            vim.keymap.set('n', '<A-z>', ':Telescope projects<cr>')
        end
    }

    use 'tpope/vim-eunuch' -- some file system commands (e.g., :Remove)

    use 'justinmk/vim-gtfo' -- start filemanager or terminal in dir of current buffer

    use { 'kyazdani42/nvim-tree.lua',
        requires = {
            'kyazdani42/nvim-web-devicons', -- optional, for file icon
        },
        config = function()
            require'nvim-tree'.setup {
                hijack_netrw = false
            }

			vim.api.nvim_set_keymap('n', '<F2>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
        end
    }

    use { 'elihunter173/dirbuf.nvim' }

    -- core features
    use { 'nvim-treesitter/nvim-treesitter', -- tree sitter support
        run = ':TSUpdate',
        config = function()
            require('nvim-treesitter.configs').setup {
                ensure_installed = { 'r', 'c', 'cpp', 'lua', 'python', 'julia', 'bash', 'fish', 'latex', 'bibtex', 'yaml', 'json' },
                highlight = {
                    enable = true,
                    -- disable = { 'r' }
                },
                indent = {
                    enable = false,
                },
                textobjects = {
                    select = {
                        enable = true,
                        lookahead = true,
                        keymaps = {
                            ["af"] = "@function.outer",
                            ["if"] = "@function.inner",
                            ["aa"] = "@parameter.outer",
                            ["ia"] = "@parameter.inner",
                        },
                    },

                    swap = {
                        enable = true,
                        swap_next = {
                            ["<leader>a"] = "@parameter.inner",
                        },
                        swap_previous = {
                            ["<leader>A"] = "@parameter.inner",
                        },
                    },
                },

            }
        end
    }

    use 'nvim-treesitter/nvim-treesitter-textobjects'

    use { 'neovim/nvim-lspconfig', -- LSP support
        config = function()
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition)
            vim.keymap.set('n', 'gr', vim.lsp.buf.references)
        end
    }

    use { 'hrsh7th/nvim-cmp', -- completion
        requires = { 'hrsh7th/cmp-nvim-lsp', 'hrsh7th/cmp-buffer', 'hrsh7th/cmp-path' },
        config = function()
            local cmp = require'cmp'
            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
            require('lspconfig').r_language_server.setup{ capabilities }

            cmp.setup {
                snippet = {
                    expand = function(args)
                        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
                    end,
                },
                sources = cmp.config.sources({
                    { name = 'vsnip' },
                    { name = 'nvim_lsp' },
                    { name = 'path' },
                    { name = 'buffer' },
                })
            }
        end
    }

    use { 'hrsh7th/vim-vsnip',
        requires = { 'hrsh7th/cmp-vsnip', 'rafamadriz/friendly-snippets', 'hrsh7th/vim-vsnip-integ' }
    }

    use { 'tpope/vim-repeat' -- repeat more stuff
    }

    -- appearance
    use { 'ellisonleao/gruvbox.nvim',
        requires = {'rktjmp/lush.nvim'},
        config = function()
            vim.cmd([[colorscheme gruvbox]])
        end
    }

    use { 'lukas-reineke/indent-blankline.nvim' } -- visual indent lines

    use { 'romgrk/barbar.nvim', -- tabline
        requires = { 'kyazdani42/nvim-web-devicons' },
        config = function()
            local map = vim.api.nvim_set_keymap
            local opts = { noremap = true, silent = true }
			map('n', '<C-h>', ':BufferPrevious<CR>', opts)
			map('n', '<C-l>', ':BufferNext<CR>', opts)
			map('n', '<A-1>', ':BufferGoto 1<CR>', opts)
			map('n', '<A-2>', ':BufferGoto 2<CR>', opts)
			map('n', '<A-3>', ':BufferGoto 3<CR>', opts)
			map('n', '<A-4>', ':BufferGoto 4<CR>', opts)
			map('n', '<A-5>', ':BufferGoto 5<CR>', opts)
			map('n', '<A-6>', ':BufferGoto 6<CR>', opts)
			map('n', '<A-7>', ':BufferGoto 7<CR>', opts)
			map('n', '<A-8>', ':BufferGoto 8<CR>', opts)
			map('n', '<A-9>', ':BufferGoto 9<CR>', opts)
			map('n', '<A-c>', ':BufferClose<CR>', opts)
        end
    }

    use { 'mhinz/vim-startify', -- start screen
        config = function()
            vim.g.startify_bookmarks = { {n = '~/.config/nvim/lua/plugins.lua'}, {f = '~/.config/fish/config.fish'}, {r = '~/.Rprofile'} }
            vim.g.startify_change_to_dir = 0
        end
    }

    use { 'hoob3rt/lualine.nvim', -- statusline
        requires = {'kyazdani42/nvim-web-devicons' },
        config = function()
            require('lualine').setup {
                options = {
                    globalstatus = true
                },
                sections = { lualine_c = { { 'filename', path = 1 } } } -- relative file name,
            }
        end
    }

    use { 'lewis6991/gitsigns.nvim', -- sign column
        requires = { 'nvim-lua/plenary.nvim' },
        config = function()
            require('gitsigns').setup()
        end
    }

    use { 'kshenoy/vim-signature' -- visual marks
    }

    -- edit helpers

    use {
        'zegervdv/nrpattern.nvim',
        config = function()
            local patterns = require("nrpattern.default")
            patterns[{"TRUE", "FALSE"}] = {priority = 1}
            require"nrpattern".setup(patterns)
        end,
    }

    use { 'junegunn/vim-easy-align',
        opt = true,
        cmd = 'EasyAlign'
    }

    -- use 'inkarkat/vim-ReplaceWithRegister'
    use { 'svermeulen/vim-subversive',
        config = function()
            local map = vim.keymap.set
            map('n', 's', '<Plug>(SubversiveSubstitute)')
            map('n', 'ss', '<Plug>(SubversiveSubstituteLine)')
            map('n', 'S', '<Plug>(SubversiveSubstituteToEndOfLine)')

            map('x', 's', '<plug>(SubversiveSubstitute)')
            map('x', 'p', '<plug>(SubversiveSubstitute)')
            map('x', 'P', '<plug>(SubversiveSubstitute)')
        end
    }

    use { 'editorconfig/editorconfig-vim',
        config = function()
            vim.g.EditorConfig_exclude_patterns = {'fugitive://.*', 'scp://.*'}
        end
    }

    use 'tpope/vim-endwise' -- completions for viml/zsh/...

    use 'tpope/vim-surround' -- additional surroundings

    use 'farmergreg/vim-lastplace' -- restore curson position

    use { 'matze/vim-move', -- move lines/selections quickly up and down
        as = 'move',
        config = function()
            vim.g.move_map_keys = 0
            local map = vim.keymap.set
            map('n', '<C-j>', '<Plug>MoveLineDown')
            map('n', '<C-k>', '<Plug>MoveLineUp')
            map('v', '<C-j>', '<Plug>MoveBlockDown')
            map('v', '<C-k>', '<Plug>MoveBlockUp')
        end
    }

    use { 'numToStr/Comment.nvim',  -- comment stuff
        config = function()
            require('Comment').setup()
        end
    }

    -- use 'wellle/targets.vim' -- more targets

    -- git
    use 'tpope/vim-fugitive' -- git support

    -- language support
    use 'dag/vim-fish'

    use { 'jalvesaq/Nvim-R', -- r support
        as = 'r',
        requires = 'mllg/vim-devtools-plugin',
        ft = {'r', 'rmd', 'rnoweb'},
        config = function()
            local g = vim.g

            g.R_nvim_wd = -1
            g.R_assign = 0
            g.R_applescript = 0
            g.rout_follow_colorscheme = 1
            g.R_nvimpager = 'horizontal'
            g.R_openpdf = 0
            g.R_openhtml = 0
            g.r_indent_align_args = 0

            local map = vim.keymap.set
            map('v', '<A-r>', '<Plug>RDSendSelection')
            map('n', '<A-r>', '<Plug>RDSendLine')
        end
    }

    use 'lervag/vimtex' -- tex support

    use 'cespare/vim-toml' -- better toml

    use { 'rhysd/vim-grammarous', -- spell / grammar
        opt = true,
        cmd = 'GrammarousCheck',
        config = function()
            local map = vim.keymap.set
            map('n', '<leader>gf', '<Plug>(grammarous-fixit)')
            map('n', '<leader>gn', '<Plug>(grammarous-move-to-next-error)')
            map('n', '<leader>gp', '<Plug>(grammarous-move-to-previous-error)')
        end
    }
end)
