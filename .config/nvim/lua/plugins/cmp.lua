local M = {
    'hrsh7th/nvim-cmp',

    event = 'InsertEnter',

    dependencies = {
        { 'L3MON4D3/LuaSnip', dependencies = 'rafamadriz/friendly-snippets' },
        { 'rafamadriz/friendly-snippets' },
        { 'hrsh7th/cmp-buffer' },
        { 'hrsh7th/cmp-path' },
        { 'hrsh7th/cmp-nvim-lsp' },
        { 'hrsh7th/cmp-nvim-lua' },
        { 'hrsh7th/cmp-calc' },
        { 'saadparwaiz1/cmp_luasnip' },
    },


    config = function()
        local cmp = require 'cmp'
        local luasnip = require 'luasnip'

        require('luasnip.loaders.from_vscode').lazy_load()

        cmp.setup {
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert {
                ['<C-d>'] = cmp.mapping.scroll_docs(-4),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),
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
            },
            sources = {
                { name = 'nvim_lsp' },
                { name = 'luasnip' },
                { name = 'nvim_lua' },
                { name = 'buffer',
                    option = {
                        get_bufnrs = function()
                            local bufs = {}
                            for _, buf in ipairs(vim.api.nvim_list_bufs()) do
                                local bytes = vim.api.nvim_buf_get_offset(buf, vim.api.nvim_buf_line_count(buf))
                                bufs[buf] = (bytes < 1048576) -- 1 MB
                            end
                            return vim.tbl_keys(bufs)
                        end
                    },
                },
                { name = 'path' },
                { name = 'calc' },

            },
        }

    end
}

return M
