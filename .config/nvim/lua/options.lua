local opt = vim.opt

-- appearance
opt.termguicolors = true
opt.cursorline = true
opt.number = true
opt.scrolloff = 2
opt.laststatus = 3
opt.signcolumn = 'yes'


-- formating
opt.shiftwidth = 4
opt.softtabstop = 4
opt.expandtab = true
opt.formatoptions:append('r')
opt.breakindent = true


-- searches
opt.ignorecase = true
opt.smartcase = true
opt.showmatch = true
opt.gdefault = false

-- completion
opt.completeopt = 'menuone,noselect'
-- opt.shortmess:append { c = true }


-- os integration
opt.clipboard = 'unnamedplus'
opt.updatetime = 500
opt.mouse = 'a'


-- file handling
opt.undofile = true


-- localization
opt.spelllang = { 'en_us', 'de' }
opt.spellsuggest = 'best,10'
opt.printoptions = 'paper:A4,number:y'

-- use ripgrep
if (vim.fn.executable('rg')) then
    opt.grepprg = 'rg --vimgrep --no-heading --smart-case'
end
