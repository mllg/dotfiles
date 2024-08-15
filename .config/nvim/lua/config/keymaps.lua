-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "-", "<cmd>Oil<cr>", { desc = "Open parent directory" })
vim.keymap.set("n", "<c-n>", ":cnext<cr>", { desc = "Next error" })
vim.keymap.set("n", "<c-p>", ":cprev<cr>", { desc = "Previous error" })
