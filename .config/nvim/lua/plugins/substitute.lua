return {
  "gbprod/substitute.nvim",
  dependencies = "gbprod/yanky.nvim",

  keys = {
    { "s", function() require("substitute").operator() end, },
    { "ss", function() require("substitute").line() end, },
    { "S", function() require("substitute").eol() end, },
    { "s", function() require("substitute").visual() end, mode = "x", },
  },

  config = function()
    require("substitute").setup({
      on_substitute = function(event)
        require("yanky").init_ring("p", event.register, event.count, event.vmode:match("[vV�]"))
      end,
    })
  end,
}
