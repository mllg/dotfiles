return {
  "R-nvim/R.nvim",
  opts = function(_, opts)
    local default_on_ft = opts.hook.on_filetype

    opts.hook = {
      on_filetype = function()
        default_on_ft()

        local function send(str) require('r.send').cmd(str) end
        local cmd = vim.api.nvim_create_user_command

        -- Commands for package development
        cmd('RLoadPackage', function() send('devtools::load_all()') end, { nargs = 0 })
        cmd('RCheckPackage', function() send('devtools::check()') end, { nargs = 0 })
        cmd('RTestPackage', function(opts) send('devtools::test(filter = "' .. opts.args .. '")') end, { nargs = '?' })
        cmd('RDocumentPackage', function() send('devtools::document()') end, { nargs = 0 })
        cmd('RMake', function() send('devtools::document(); devtools::install()') end, { nargs = 0 })
      end
    }
  end
}
