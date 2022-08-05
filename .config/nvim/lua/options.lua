local opt = vim.opt

-- appearance
vim.cmd([[colorscheme gruvbox-material]])
opt.termguicolors = true
opt.cursorline = true
opt.number = true
opt.relativenumber = false
opt.scrolloff = 2
opt.laststatus = 3
opt.guifont='FiraCode Nerd Font Mono:h15'


-- buffers
opt.autowriteall = true
opt.autoread = true


-- formating
opt.expandtab = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.formatoptions:remove({'r', 'c'})


opt.wrap = true
opt.breakindent = true


-- searches
opt.showmatch = true
opt.ignorecase = true
opt.smartcase = true
opt.gdefault = true
opt.wrapscan = true
opt.inccommand = 'nosplit'


-- completion
opt.completeopt = 'menu,menuone,noselect'
-- opt.shortmess:append { c = true }

-- os integration
opt.clipboard = 'unnamedplus'


-- file handling
opt.undofile = true

-- localization
opt.spelllang = 'en,de'
opt.spellsuggest = 'fast,20'
opt.printoptions = 'paper:A4,number:y'


