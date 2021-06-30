-- Bootstrap packer.nvim
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
    execute 'packadd packer.nvim'
end

-- Plugins
require('packer').startup(function()
    -- packer manages itself
    use { 'wbthomason/packer.nvim' }

    -- navigation
    use { 'nvim-telescope/telescope.nvim', -- fuzzy finder
        requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
    }

    use { 'tpope/vim-eunuch' -- some file system commands (e.g., :Remove)
    }

    -- core features
    use { 'nvim-treesitter/nvim-treesitter', -- tree sitter support
        run = ':TSUpdate'
    }

    use { 'nvim-treesitter/nvim-treesitter-textobjects', -- treesitter textobjects
        config = function()
            require('nvim-treesitter.configs').setup {
                textobjects = {
                    swap = {
                        enable = true,
                        swap_next = {
                            ['<leader>a'] = '@parameter.inner',
                        },
                        swap_previous = {
                            ['<leader>A'] = '@parameter.inner',
                        },
                    },

                    select = {
                        enable = true,
                        keymaps = {
                            ['af'] = '@function.outer',
                            ['if'] = '@function.inner',
                            ['ac'] = '@class.outer',
                            ['ic'] = '@class.inner',
                            ['ia'] = '@parameter.inner',
                        },
                    },
                }
            }
        end
    }

    use { 'neovim/nvim-lspconfig', -- LSP support
        config = function()
            require('lspconfig').r_language_server.setup{}
        end
    }

    use { 'hrsh7th/nvim-compe', -- completion
        config = function()
            require'compe'.setup {
                enabled = true;
                autocomplete = true;
                debug = false;
                min_length = 1;
                preselect = 'enable';
                throttle_time = 80;
                source_timeout = 200;
                incomplete_delay = 400;
                max_abbr_width = 100;
                max_kind_width = 100;
                max_menu_width = 100;
                documentation = true;

                source = {
                    path = true;
                    buffer = true;
                    calc = true;
                    nvim_lsp = true;
                    nvim_lua = true;
                    vsnip = false;
                    ultisnips = false;
                    treesitter = true;
                };
            }
        end
    }

    use { 'tpope/vim-repeat' -- repeat more stuff
    }

    -- appearance
    --[[ use {'maaslalani/nordbuddy',
        requires = {'tjdevries/colorbuddy.nvim'}
    } ]]

    use { 'npxbr/gruvbox.nvim',
        requires = {'rktjmp/lush.nvim'}
    }

    use { 'romgrk/barbar.nvim', -- tabline
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    use { 'mhinz/vim-startify', -- start screen
        config = function()
            vim.g.startify_bookmarks = { {n = '~/.config/nvim/init.vim'}, {f = '~/.config/fish/config.fish'}, {r = '~/.Rprofile'} }
            vim.g.startify_change_to_dir = 0
        end
    }

    use { 'hoob3rt/lualine.nvim', -- statusline
        requires = {'kyazdani42/nvim-web-devicons', opt = true },
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

    -- edit helpers
    use { 'editorconfig/editorconfig-vim',
        config = function()
            vim.g.EditorConfig_exclude_patterns = {'fugitive://.*', 'scp://.*'}
        end
    }

    use { 'tpope/vim-endwise' -- completions for viml/zsh/...
    }

    use { 'tpope/vim-surround' -- additional surroundings
    }

    use { 'farmergreg/vim-lastplace' -- restore curson position
    }

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

    use { 'b3nj5m1n/kommentary'
    }

    -- git
    use { 'TimUntersberger/neogit',
        requires = 'nvim-lua/plenary.nvim'
    }

    -- R
    use { 'jalvesaq/Nvim-R',
        as = 'r',
        requires = 'mllg/vim-devtools-plugin',
        ft = {'r', 'rmd'},
        config = function()
            local g = vim.g

            g.R_assign = 0
            g.R_applescript = 0
            g.rout_follow_colorscheme = 1
            g.R_nvimpager = 'horizontal'
            g.R_openpdf = 0
            g.R_openhtml = 0
            g.r_indent_align_args = 0

            vim.api.nvim_set_keymap('v', '<A-r>', '<Plug>RDSendSelection', { noremap = false })
            vim.api.nvim_set_keymap('n', '<A-r>', '<Plug>RDSendLine', { noremap = false })
        end
    }

    use { 'mllg/vim-cdroot',
        config = function()
			vim.g.cdroot_markers = { '.projectroot', '.git', '.svn', 'DESCRIPTION' }
        end
    }

end)
