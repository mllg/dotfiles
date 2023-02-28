local opt = vim.opt

-- appearance
opt.scrolloff = 2
opt.laststatus = 3


-- formating
opt.shiftwidth = 4
opt.expandtab = true
opt.formatoptions:append('r')
opt.wrap = true


-- searches
opt.showmatch = true
opt.gdefault = false

-- completion
-- opt.shortmess:append { c = true }


-- os integration
opt.clipboard = 'unnamedplus'
opt.updatetime = 500


-- localization
opt.spelllang = { 'en_us', 'de' }
opt.spellsuggest = 'best,10'
opt.printoptions = 'paper:A4,number:y'

-- use ripgrep
if (vim.fn.executable('rg')) then
    opt.grepprg = 'rg --vimgrep --no-heading --smart-case'
end


-- vim.opt.listchars:append("tab = '>'")
