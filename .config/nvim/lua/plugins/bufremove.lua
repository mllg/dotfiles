return {
  "echasnovski/mini.bufremove",
  config = true,
  keys = {
    { "<bs>", function() require('mini.bufremove').delete() end, desc = "Delete buffer" }
  }
}
