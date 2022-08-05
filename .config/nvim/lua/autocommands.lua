local autocmd = vim.api.nvim_create_autocmd

local group = vim.api.nvim_create_augroup("init_lua", { clear = true })
autocmd('BufWritePost', {
    group = group,
    pattern = { vim.env.MYVIMRC, '/Users/michel/.config/nvim/lua/*.lua' },
    command = 'source $MYVIMRC | PackerCompile'
})
