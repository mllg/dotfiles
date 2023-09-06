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

map('n', '-', function()
  local pos = vim.api.nvim_win_get_cursor(0)
  local linenr = pos[1] - 1
  local buf_line = vim.trim(vim.api.nvim_buf_get_lines(0, linenr, linenr + 1, false)[1])

  -- check if we are in a roxygen example region of an r script
  -- if yes, remove the "#'" prefix and send remaining line
  if vim.bo.filetype == 'r' and vim.startswith(buf_line, "#'") then
    for i = linenr, 0, -1 do
      local cur_line = vim.trim(vim.api.nvim_buf_get_lines(0, i, i + 1, false)[1])
      if not vim.startswith(cur_line, "#'") then
        break
      end
      if vim.startswith(cur_line, "#' @examples") then
        buf_line = string.gsub(buf_line, "^#'%s*", "")
        break
      end
    end
  end

  require('iron.core').send('r', buf_line)

  if (pos[1] < vim.api.nvim_buf_line_count(0)) then
    vim.api.nvim_win_set_cursor(0, { pos[1] + 1, pos[2] })
  end
end)

map('v', '-',
  function()
    local core = require("iron.core")
    core.send('r', core.mark_visual()) -- FIXME ugly hack
  end,
  { noremap = true, desc = "Send Visual Selection to REPL" }
)

map('n', '<leader>rs',
  function()
    require("iron.core").run_motion("send_motion")
  end,
  { noremap = true, desc = "Send Motion to REPL" }
)

map('n', '<leader>ra',
  function()
    require("iron.core").send_until_cursor()
  end,
  { noremap = true, desc = "Send Above to REPL" }
)

map('n', '<leader>rf',
  function()
    require("iron.core").send_file()
  end,
  { noremap = true, desc = "Send File to REPL" }
)


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

