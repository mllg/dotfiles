-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.g.maplocalleader = "ß"

local opt = vim.opt

opt.wrap = true
opt.breakindent = true

opt.spelllang = { "en_us", "de" }
opt.spellsuggest = "best,10"
