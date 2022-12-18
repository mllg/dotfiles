local opt = vim.opt

-- appearance
opt.termguicolors = true
opt.cursorline = true
opt.number = true
opt.scrolloff = 2
opt.laststatus = 3


-- -- formating
-- -- opt.formatoptions:remove({'r', 'c'})
opt.breakindent = true

-- -- searches
opt.ignorecase = true
opt.smartcase = true
opt.showmatch = true
 opt.gdefault = true

-- -- completion
opt.completeopt = 'menuone,noselect'

-- -- os integration
opt.clipboard = 'unnamedplus'

-- -- file handling
opt.undofile = true


-- -- localization
opt.spelllang = 'en,de'
opt.spellsuggest = 'fast,20'
opt.printoptions = 'paper:A4,number:y'
