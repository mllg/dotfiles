vim.g.r_syntax_hl_roxygen = true 

local function iron_send(str)
    require('iron.core').send('r', { str })
end

local function r_send(str)
    return function()
        iron_send(str)
    end
end

-- Commands
vim.api.nvim_create_user_command(
  'RLoadPackage',
  r_send('devtools::load_all()'),
  { nargs = 0 }
)

vim.api.nvim_create_user_command(
  'RCheckPackage',
  r_send('devtools::check()'),
  { nargs = 0 }
)

vim.api.nvim_create_user_command(
  'RTestPackage',
  function(opts)
    iron_send('devtools::test(filter = "' .. opts.args .. '")')
  end,
  { nargs = '?' }
)

vim.api.nvim_create_user_command(
  'RDocumentPackage',
  r_send('devtools::document()'),
  { nargs = 0 }
)

vim.api.nvim_create_user_command(
  'RMake',
  r_send('devtools::document(); devtools::install()'),
  { nargs = 0 }
)

vim.api.nvim_create_user_command(
  'RHelp',
  function(opts)
    iron_send('help("' .. opts.args .. '")')
  end,
  { nargs = 1 }
)

-- Keymaps
local map = vim.keymap.set

map('n', '<leader>rh',
  function()
    require('iron.core').send('r', { 'help("' .. vim.fn.expand('<cword>') .. '")' })
  end,
  { noremap = true, buffer = true, desc = "Open R Help" }
)

map('n', '<leader>rp',
  function()
    require('iron.core').send('r', { 'print(' .. vim.fn.expand('<cword>') .. ')' })
  end,
  { noremap = true, buffer = true, desc = "Print R Object"}
)

map('n', '<leader>ri',
  function()
    require('iron.core').send('r', { '.Internal(inspect(' .. vim.fn.expand('<cword>') .. '))' })
  end,
  { noremap = true, buffer = true, desc = "Inspect R Object" }
)


map('n', '<leader>rt',
  function()
    require('iron.core').send('r', { 'str(' .. vim.fn.expand('<cword>') .. ')' })
  end,
  { noremap = true, buffer = true, desc = "Show Structure" }
)

map('n', '<leader>rb',
  function()
    require('iron.core').send('r', { 'traceback()' })
  end,
  { noremap = true, buffer = true, desc = "Show Traceback" }
)

map('n', '<leader>rq',
  function()
    require('iron.core').close_repl('r')
  end,
  { noremap = true, buffer = true, desc = "Quit REPL" }
)

