require("rust-tools").setup({
  tools = {
    runnable = {
      use_telescope = true
    },
    inlay_hints = {
      auto = true,
      show_parameter_hints = true,
      parameter_hints_prefix = "",
      other_hints_prefix = "",
    },
  },
})
