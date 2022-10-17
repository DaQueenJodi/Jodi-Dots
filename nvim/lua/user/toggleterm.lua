local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true}

local toggleterm = require("toggleterm")




toggleterm.setup({
   size = 20,
   open_mapping = [[<leader>a]],
   hide_numbers = true,
   shade_filetypes = {},
   shading_factor = 2,
   start_in_insert = true,
   insert_mappings = false,
   persist_size = true,
   direction = "horizontal",
   close_on_exit = true,
   shell = "fish",
})




