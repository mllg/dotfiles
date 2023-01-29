local map = vim.keymap.set

map({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

local opts = { noremap = true, silent = true}
map('n', 'Q', '@q', opts)
map('v', 'p', '"_dP', opts)
map('n', '<c-n>', ':cnext<cr>', opts)
map('n', '<c-p>', ':cprev<cr>', opts)
map('n', 'n', 'nzzzv', opts)
map('n', 'N', 'Nzzzv', opts)
map('v', '<', '<gv', opts)
map('v', '>', '>gv', opts)

-- Switch buffers with <shift> hl
vim.keymap.set("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev buffer", silent = true })
vim.keymap.set("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next buffer", silent = true })
