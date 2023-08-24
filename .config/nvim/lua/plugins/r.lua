local M = {
  "jalvesaq/Nvim-R",
  dependencies = "mllg/vim-devtools-plugin",
  ft = { "r", "rmd", "quarto" },

  -- keys = {
  --   { "<leader>ra", "<Plug>RDSendAboveLines()", desc = "Send Above Lines" },
  --   { "<leader>rr", "<Plug>RDSendLine", desc = "Send Line" },
  --   { "<leader>rf", "<Plug>RDSendFile()", desc = "Send File" },
  -- },

  config = function()
    local g = vim.g
    g.R_assign = 0
    -- g.R_nvim_wd = -1
    -- g.R_assign = 0
    -- g.R_applescript = 0
    -- g.rout_follow_colorscheme = 1
    -- g.R_nvimpager = 'horizontal'
    -- g.R_openpdf = 0
    -- g.R_openhtml = 0
    -- g.r_indent_align_args = 0

    local map = vim.keymap.set
    map("n", "<localleader><localleader>", "<Plug>RDSendLine")
    -- map("n", "<leader>ra", "<Plug>RDSendAboveLines", desc = "Send Above Lines")
  end,
}

return M
