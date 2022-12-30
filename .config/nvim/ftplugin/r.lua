local opt = vim.opt_local
opt.tabstop = 2
opt.shiftwidth = 2
opt.spell = true
opt.spelllang = 'en'


local iron = require('iron.core')


local function iron_send(str)
    iron.send('r', { str })
end

local function r_send(str)
    return function()
        iron_send(str)
    end
end

vim.api.nvim_create_user_command('RLoadPackage',
    r_send('devtools::load_all()'),
    { nargs = 0 }
)

vim.api.nvim_create_user_command('RCheckPackage',
    r_send('devtools::check()'),
    { nargs = 0 }
)

vim.api.nvim_create_user_command('RTestPackage',
    r_send('devtools::test()'),
    { nargs = 0 }
)

vim.api.nvim_create_user_command('RDocumentPackage',
    r_send('devtools::document()'),
    { nargs = 0 }
)

vim.api.nvim_create_user_command('RMake',
    r_send('devtools::document(); devtools::install()'),
    { nargs = 0 }
)

vim.api.nvim_create_user_command('RHelp',
    function(opts)
        iron_send('help("' .. opts.args .. '")')
    end,
    { nargs = 1 }
)

local map = vim.keymap.set

map('n', '<space><space>', function()
    local pos = vim.api.nvim_win_get_cursor(0)
    local linenr = pos[1] - 1
    local buf_line = vim.trim(vim.api.nvim_buf_get_lines(0, linenr, linenr + 1, 0)[1])

    -- check if we are in a roxygen example region
    -- if yes, remove the "#'" prefix and remaining send line
    -- this should be done using treesitter :/
    if vim.startswith(buf_line, "#'") then
        for i = linenr, 0, -1 do
            local cur_line = vim.trim(vim.api.nvim_buf_get_lines(0, i, i + 1, 0)[1])
            if not vim.startswith(cur_line, "#'") then
                break
            end
            if vim.startswith(cur_line, "#' @examples") then
                buf_line = string.gsub(buf_line, "^#'%s*", "")
                break
            end
        end
    end

    iron_send(buf_line)

    if (pos[1] < vim.fn.line('$')) then
        vim.api.nvim_win_set_cursor(0, { pos[1] + 1, pos[2] })
    end
end)

map('n', '<leader>rh',
    function()
        iron.send('r', { 'help("' .. vim.fn.expand('<cword>') .. '")' })
    end,
    { noremap = true}
)

map('n', '<leader>rp',
    function()
        iron.send('r', { 'print(' .. vim.fn.expand('<cword>') .. ')' })
    end,
    { noremap = true}
)

map('n', '<leader>rt',
    function()
        iron.send('r', { 'str(' .. vim.fn.expand('<cword>') .. ')' })
    end,
    { noremap = true}
)
