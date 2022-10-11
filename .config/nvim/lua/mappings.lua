local map = vim.keymap.set

map('n', '<Space>', '<Nop>', { noremap = false })
vim.g.mapleader = ' '
vim.g.maplocalleader = ','

local opts = { noremap = true, silent = true}
map('n', 'Q', '@q', opts)
map('v', 'p', '"_dP', opts)
map('n', '<c-n>', ':cnext<cr>', opts)
map('n', '<c-p>', ':cprev<cr>', opts)
map('n', '<c-l>', ':bnext<cr>', opts)
map('n', '<c-h>', ':bprev<cr>', opts)
map('n', 'n', 'nzzzv', opts)
map('n', 'N', 'Nzzzv', opts)
map('v', '<', '<gv', opts)
map('v', '>', '>gv', opts)

opts = { noremap = true, silent = true, expr = true }
map('n', 'k', "v:count == 0 ? 'gk' : 'k'", opts)
map('n', 'j', "v:count == 0 ? 'gj' : 'j'", opts)
