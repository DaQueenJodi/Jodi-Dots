vim.g.catppuccin_flavour = "macchiato" -- latte, frappe, macchiato, mocha

require('catppuccin').setup({integrations = {cmp = true, treesitter = true}})

vim.cmd 'colorscheme catppuccin'

-- vim.cmd "colorscheme palenight"
