return {
  "hkupty/iron.nvim",

  ft = { "r", "rmd", "quarto" },

  keys = {
    { "<f10>", "<cmd>IronRepl<cr>", desc = "Start Iron Repl" },
  },

  config = function()
    local iron = require("iron.core")
    local map = vim.keymap.set

    iron.setup({
      config = {
        scratch_repl = false,
        scope = require("iron.scope").singleton,
        repl_open_cmd = require("iron.view").split.vertical.botright(0.35),
        repl_definition = {
          r = {
            command = { "R", "--no-save" },
          },
          quarto = {
            command = { "R", "--no-save" },
          },
        },
      },
    })

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

      iron.send('r', buf_line)

      if (pos[1] < vim.api.nvim_buf_line_count(0)) then
        vim.api.nvim_win_set_cursor(0, { pos[1] + 1, pos[2] })
      end
    end)

    map('v', '-',
      function()
        require("iron.core").visual_send()
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

  end,
}
