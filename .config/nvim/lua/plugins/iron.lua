return {
  "hkupty/iron.nvim",

  ft = { "r", "rmd", "quarto" },

  keys = {
    { "<f10>", "<cmd>IronRepl<cr>", desc = "Start Iron Repl" },
  },

  config = function()
    local iron = require("iron.core")

    iron.setup({
      config = {
        scratch_repl = false,
        scope = require("iron.scope").singleton,
        repl_open_cmd = require("iron.view").split.vertical.botright(0.35),
        should_map_plug = false,
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
  end,
}
