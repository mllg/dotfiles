local opt = vim.opt

-- appearance
opt.cursorline = true
opt.number = true
opt.relativenumber = false

-- buffers
opt.autowriteall = true
opt.autoread = true
opt.hidden = true
opt.autochdir = false

-- indentation
opt.expandtab = true
opt.tabstop = 4
opt.shiftwidth = 0
opt.softtabstop = -1
opt.shiftround = true
opt.wrap = true
opt.breakindent = true

-- searches
opt.showmatch = true
opt.ignorecase = true
opt.smartcase = true
opt.gdefault = true
opt.wrapscan = true

-- completion
opt.completeopt = "menuone,noselect"
--opt.shortmess = opt.shortmess + {'c'}

-- clipboard
opt.clipboard = 'unnamedplus'

-- file handling
opt.encoding = 'utf-8'
opt.fileformats:append { 'mac' }
opt.nrformats:remove { 'octal' }
opt.undofile = true

-- localization
opt.spelllang = 'en,de'
opt.spellsuggest = 'fast,20'
opt.printoptions = 'paper:A4,number:y'
