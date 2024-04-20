return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      "bash",
      "html",
      "javascript",
      "json",
      "lua",
      "markdown",
      "markdown_inline",
      "python",
      "query",
      "regex",
      "tsx",
      "typescript",
      "vim",
      "yaml",
      "c",
      "cpp",
      "r",
      "rnoweb",
      "fish",
      "latex",
      "bibtex",
      "html",
      "css",
      "javascript",
      "php",
      "make",
      "comment",
      "gitcommit",
      "gitignore",
    },

    highlight = {
      enable = true,
      disable = { "r" } -- for roxygen highlighting
    },

    indent = {
      enable = true
    }
  },
}
