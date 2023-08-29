return {
  {
  "neovim/nvim-lspconfig",
  opts = { autoformat = false },
  },
  {
  "williamboman/mason.nvim",
    ensure_installed = {
      "stylua",
      "shfmt",
      "r-language-server",
    },
  },
}
