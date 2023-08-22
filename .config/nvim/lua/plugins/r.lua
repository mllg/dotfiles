local M = {
  "jalvesaq/Nvim-R",
  dependencies = "mllg/vim-devtools-plugin",
  ft = { "r", "rmd", "quarto" },

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
    map("v", "<localleader>", "<Plug>RDSendSelection")
    map("n", "<localleader><localleader>", "<Plug>RDSendLine")
  end,
}

return M
