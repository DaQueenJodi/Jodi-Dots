require("catpuccin").setup({
  flavour = "mocha",
  term_colors = true,
  styles = {
    comments = {},
    conditionals = {},
    functions = {"bold"},
  },
  integrations = {
    treesitter = true,
  }
})
