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

    use { 'nvim-lua/plenary.nvim' }

    -- file navigation
    use { 'nvim-telescope/telescope.nvim', -- fuzzy finder
        requires = { 'nvim-lua/popup.nvim', 'nvim-lua/plenary.nvim' },
        --[[ opt = true,
        cmd = 'Telescope', ]]
		config = function()
            local map = vim.api.nvim_set_keymap
			map('n', '<A-f>', ':Telescope find_files<cr>', { noremap = true })
			map('n', '<A-g>', ':Telescope live_grep<cr>', { noremap = true })
			map('n', '<A-b>', ':Telescope buffers<cr>', { noremap = true })
		    map('n', '<A-s>', ':Telescope search_history<cr>', { noremap = true })
			map('n', '<A-t>', ':Telescope git_branches<cr>', { noremap = true })
			map('n', '<A-y>', ':Telescope registers<cr>', { noremap = true })
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
            local map = vim.api.nvim_set_keymap
			map('n', '<A-i>', ':Telescope gh issues<cr>', { noremap = true })
			map('n', '<A-p>', ':Telescope gh pull_request<cr>', { noremap = true })
        end
    }

    use { 'ahmedkhalf/project.nvim',
        requires =  { 'nvim-telescope/telescope.nvim' },
        config = function()
            require('project_nvim').setup {
                patterns = { '.projectroot', '.git', '.hg', '.bzr', '.svn', 'Makefile', 'package.json', 'DESCRIPTION', 'init.lua' }
            }
            local map = vim.api.nvim_set_keymap
            map('n', '<A-z>', ':Telescope projects<cr>', { noremap = true })
            require('telescope').load_extension('projects')
        end
    }

    use 'tpope/vim-eunuch' -- some file system commands (e.g., :Remove)

    use 'justinmk/vim-dirvish' -- better netwr

    use 'justinmk/vim-gtfo' -- start filemanager or terminal in dir of current buffer

    -- core features
    use { 'nvim-treesitter/nvim-treesitter', -- tree sitter support
        run = ':TSUpdate',
        config = function()
            require('nvim-treesitter.configs').setup {
                ensure_installed = { 'r', 'c', 'cpp', 'lua', 'python', 'julia', 'bash', 'fish', 'latex', 'bibtex', 'yaml', 'json' },
                highlight = {
                    enable = true,
                },
                indent = {
                    enable = true,
                }
            }
        end
    }

    use { 'neovim/nvim-lspconfig', -- LSP support
        config = function()
            require('lspconfig').r_language_server.setup{}
        end
    }

    use { 'hrsh7th/nvim-cmp', -- completion
        requires = { 'hrsh7th/cmp-nvim-lsp', 'hrsh7th/cmp-buffer', 'hrsh7th/cmp-path', 'uga-rosa/cmp-dictionary' },
        config = function()
            local cmp = require'cmp'
            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

            cmp.setup {
                mapping = {
                    ['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' })
                },
                sources = cmp.config.sources({
                    { name = 'nvim_lsp' },
                    -- { name = 'vsnip' }, -- For vsnip users.
                    -- { name = 'luasnip' }, -- For luasnip users.
                    -- { name = 'ultisnips' }, -- For ultisnips users.
                    -- { name = 'snippy' }, -- For snippy users.
                    { name = 'path' },
                    { name = 'buffer' },
                    { name = 'dictionary' },
                })
            }
        end
    }

    use { 'tpope/vim-repeat' -- repeat more stuff
    }

    -- appearance
    use { 'npxbr/gruvbox.nvim',
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
			map('n', '<C-h>', ':BufferPrevious<CR>', { noremap = true, silent = true })
			map('n', '<C-l>', ':BufferNext<CR>', { noremap = true, silent = true })
			map('n', '<A-1>', ':BufferGoto 1<CR>', { noremap = true, silent = true })
			map('n', '<A-2>', ':BufferGoto 2<CR>', { noremap = true, silent = true })
			map('n', '<A-3>', ':BufferGoto 3<CR>', { noremap = true, silent = true })
			map('n', '<A-4>', ':BufferGoto 4<CR>', { noremap = true, silent = true })
			map('n', '<A-5>', ':BufferGoto 5<CR>', { noremap = true, silent = true })
			map('n', '<A-6>', ':BufferGoto 6<CR>', { noremap = true, silent = true })
			map('n', '<A-7>', ':BufferGoto 7<CR>', { noremap = true, silent = true })
			map('n', '<A-8>', ':BufferGoto 8<CR>', { noremap = true, silent = true })
			map('n', '<A-9>', ':BufferGoto 9<CR>', { noremap = true, silent = true })
			map('n', '<A-c>', ':BufferClose<CR>', { noremap = true, silent = true })
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
                sections = { lualine_c = { { 'filename', path = 1 } } } -- relative file name
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

    -- replace with hop?
    -- use 'ggandor/lightspeed.nvim'

    use { 'junegunn/vim-easy-align',
        opt = true,
        cmd = 'EasyAlign'
    }

    use 'inkarkat/vim-ReplaceWithRegister'

    use 'lambdalisue/suda.vim'

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
            local map = vim.api.nvim_set_keymap
            map('n', '<C-j>', '<Plug>MoveLineDown', { noremap = false })
            map('n', '<C-k>', '<Plug>MoveLineUp', { noremap = false })
            map('v', '<C-j>', '<Plug>MoveBlockDown', { noremap = false })
            map('v', '<C-k>', '<Plug>MoveBlockUp', { noremap = false })
        end
    }

    use 'b3nj5m1n/kommentary' -- comment in and out

    use 'wellle/targets.vim' -- more targets

    use 'machakann/vim-swap' -- swap arguments


    -- git

    use 'tpope/vim-fugitive' -- git support

    -- language support
    use 'dag/vim-fish'

    use { 'jalvesaq/Nvim-R',
        as = 'r',
        requires = 'mllg/vim-devtools-plugin',
        ft = {'r', 'rmd'},
        config = function()
            local g = vim.g
            local map = vim.api.nvim_set_keymap

            g.R_nvim_wd = -1
            g.R_assign = 0
            g.R_applescript = 0
            g.rout_follow_colorscheme = 1
            g.R_nvimpager = 'horizontal'
            g.R_openpdf = 0
            g.R_openhtml = 0
            g.r_indent_align_args = 0

            map('v', '<A-r>', '<Plug>RDSendSelection', { noremap = false })
            map('n', '<A-r>', '<Plug>RDSendLine', { noremap = false })
        end
    }

    use 'lervag/vimtex'

    use 'cespare/vim-toml'

    -- spell / grammar
    use { 'rhysd/vim-grammarous',
        opt = true,
        cmd = 'GrammarousCheck',
        config = function()
            local map = vim.api.nvim_set_keymap
            map('n', '<leader>gf', '<Plug>(grammarous-fixit)', { noremap = false })
            map('n', '<leader>gn', '<Plug>(grammarous-move-to-next-error)', { noremap = false })
            map('n', '<leader>gp', '<Plug>(grammarous-move-to-previous-error)', { noremap = false })
        end
    }

end)
