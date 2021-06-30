local opt = vim.opt


-- appearance
opt.termguicolors = true
opt.background = 'dark'
opt.cursorline = true
opt.number = true
opt.relativenumber = false
opt.scrolloff = 2


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
opt.shortmess:append { c = true }


-- os integration
opt.clipboard = 'unnamedplus'
opt.mouse = 'a'


-- file handling
opt.encoding = 'utf-8'
opt.fileformats:append { 'mac' }
opt.nrformats:remove { 'octal' }
opt.undofile = true


-- localization
opt.spelllang = 'en,de'
opt.spellsuggest = 'fast,20'
opt.printoptions = 'paper:A4,number:y'
