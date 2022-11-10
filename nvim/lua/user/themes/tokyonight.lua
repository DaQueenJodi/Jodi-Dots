require("tokyonight").setup({
  style = "night",
  light_style = "storm",
  transparent = false,
  terminal_colors = true,
  styles = {
    comments = { italic = false },
    keywords = { italic = false },
    functions = { bold = true },
  },
})

vim.cmd('colorscheme tokyonight')
