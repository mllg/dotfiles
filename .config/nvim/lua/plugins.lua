-- Bootstrap packer.nvim
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
end

require('packer').startup(function()
    -- packer manages itself
    use {
        'wbthomason/packer.nvim'
    }

    -- LSP
    use {
        'neovim/nvim-lspconfig',
        config = function()
            require('lspconfig').r_language_server.setup{}

            vim.keymap.set('n', 'gd', vim.lsp.buf.definition)
            vim.keymap.set('n', 'gr', vim.lsp.buf.references)

            require'lspconfig'.sumneko_lua.setup {
                settings = {
                    Lua = {
                        runtime = {
                            -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                            version = 'LuaJIT',
                        },
                        diagnostics = {
                            -- Get the language server to recognize the `vim` global
                            globals = { 'vim', 'use' },
                        },
                        workspace = {
                            -- Make the server aware of Neovim runtime files
                            library = vim.api.nvim_get_runtime_file("", true),
                        },
                        -- Do not send telemetry data containing a randomized but unique identifier
                        telemetry = {
                            enable = false,
                        },
                    },
                },
            }

        end
    }

    -- Treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        requires = 'nvim-treesitter/nvim-treesitter-textobjects',
        config = function()
            require('nvim-treesitter.configs').setup {
                ensure_installed = { 'lua', 'r', 'c', 'bash' },
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                },
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

    use { 'nvim-telescope/telescope-fzf-native.nvim',
        requires =  { 'nvim-telescope/telescope.nvim' },
        run = 'make',
        config = function()
            require('telescope').load_extension('fzf')
        end
    }

    use { 'mllg/telescope-rhistory.nvim',
        requires =  { 'nvim-telescope/telescope.nvim' },
        config = function()
            require('telescope').load_extension('rhistory')
			vim.keymap.set('n', '<leader>h', ':Telescope rhistory<cr>')
        end
    }

    -- fuzzy finder
    use { 'nvim-telescope/telescope.nvim',
        requires = { 'nvim-lua/plenary.nvim', 'kyazdani42/nvim-web-devicons' },
		config = function()
            local map = vim.keymap.set
			map('n', '<leader>f', require('telescope.builtin').find_files)
			map('n', '<leader>g', require('telescope.builtin').live_grep)
			map('n', '<leader>b', require('telescope.builtin').buffers)
            map('n', '<leader>m', require('telescope.builtin').oldfiles)
			map('n', '<leader>n', require('telescope.builtin').resume)
			-- map('n', '<leader>s', require('telescope.builtin').search_history)
			-- map('n', '<leader>t', require('telescope.builtin').git_branches)
			-- map('n', '<leader>y', require('telescope.builtin').registers)
			-- map('n', '<leader>l', require('telescope.builtin').lsp_workspace_symbols)
		end
    }

    use { 'ahmedkhalf/project.nvim',
        requires =  { 'nvim-telescope/telescope.nvim' },
        config = function()
            require('project_nvim').setup {
                patterns = { '.projectroot', '.git', '.svn', 'Makefile', 'package.json', 'DESCRIPTION' }
            }
            require('telescope').load_extension('projects')
            vim.keymap.set('n', '<leader>z', ':Telescope projects<cr>')
        end
    }


    -- EditorConfig Support
    -- use { 'editorconfig/editorconfig-vim',
    -- }


    -- Restore cursor position
    use 'farmergreg/vim-lastplace'


    -- Colorscheme
    use { 'sainnhe/gruvbox-material',
    }
    use { 'ellisonleao/gruvbox.nvim',
    }


    -- Completion
    use { 'hrsh7th/nvim-cmp',
        requires = {'hrsh7th/cmp-nvim-lsp', 'hrsh7th/cmp-buffer', 'hrsh7th/cmp-path',  'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip' },
        config = function()
            local has_words_before = function()
                local line, col = unpack(vim.api.nvim_win_get_cursor(0))
                return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
            end
            local cmp = require('cmp')
            local luasnip = require('luasnip')
            cmp.setup{
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end
                },
                sources = cmp.config.sources({
                    { name = 'luasnip' },
                    { 
                        name = 'buffer',
                        option = {
                            get_bufnrs = function()
                                return vim.api.nvim_list_bufs()
                            end
                        }
                    },
                    { name = 'nvim_lsp' },
                    { name = 'path' },
                }),
                mapping = {
                    ["<Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        elseif luasnip.expand_or_jumpable() then
                            luasnip.expand_or_jump()
                        elseif has_words_before() then
                            cmp.complete()
                        else
                            fallback()
                        end
                    end, { "i", "s" }),

                    ["<S-Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        elseif luasnip.jumpable(-1) then
                            luasnip.jump(-1)
                        else
                            fallback()
                        end
                    end, { "i", "s" }),

                    ['<CR>'] = cmp.mapping.confirm({ select = true }),
                    ['<C-e>'] = cmp.mapping({
                        i = cmp.mapping.abort(),
                        c = cmp.mapping.close(),
                    }),                }

            }

            local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
            require('lspconfig')['r_language_server'].setup {
                capabilities = capabilities
            }
        end,
    }

    -- Collection of mini plugins
    use { 'echasnovski/mini.nvim',
        requires = 'kyazdani42/nvim-web-devicons',
        config = function()
            local bufremove = require('mini.bufremove')
            bufremove.setup{
            }

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
        end
    }

--     use { 'hkupty/iron.nvim',
--         config = function()
--             local iron = require("iron.core")
--             iron.setup({
--                 config = {
--                     scratch_repl = false,
--                     repl_open_cmd = 'belowright 15 split',
--                 },
--                 keymaps = {
--                     send_motion = "<space>sc",
--                     visual_send = "<space>sc",
--                     send_file = "<space>sf",
--                     send_line = "<space>sl",
--                     send_mark = "<space>sm",
--                     mark_motion = "<space>mc",
--                     mark_visual = "<space>mc",
--                     remove_mark = "<space>md",
--                     cr = "<space>s<cr>",
--                     interrupt = "<space>s<space>",
--                     exit = "<space>sq",
--                     clear = "<space>cl",
--                 },
--             })
--
--
--             vim.keymap.set('n', '<space><space>', function()
--                 iron.send_line()
--
--                 local pos = vim.api.nvim_win_get_cursor(0)
--                 if (pos[1] < vim.fn.line('$')) then
--                     vim.api.nvim_win_set_cursor(0, { pos[1] + 1, pos[2] })
--                 end
--             end)
--
--
--             local cmds = {
--                 RLoadAll = 'devtools::load_all()',
--                 RCheck = 'devtools::check()',
--             }
--             for cmd, data in pairs(cmds) do
--                 vim.api.nvim_create_user_command(cmd, function() iron.send(nil, data) end, {})
--             end
--
--         end
    -- }
    use { 'jalvesaq/Nvim-R', -- r support
        as = 'r',
        requires = { 'mllg/vim-devtools-plugin' },
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
            map('v', '<leader>r', '<Plug>RDSendSelection')
            map('n', '<leader>r', '<Plug>RDSendLine')
        end
    }

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

    use { 'chentoast/marks.nvim',
    }

    use {
        'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup()
        end
    }


    use { 'elihunter173/dirbuf.nvim' -- file system browser + vidir
    }

    use 'tpope/vim-fugitive' -- git support

end)
