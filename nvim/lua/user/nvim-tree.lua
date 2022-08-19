local opts = { noremap = true, silent = true}
local keymap = vim.api.nvim_set_keymap


local nvimtree = require("nvim-tree")

nvimtree.setup()

nvimtree.setup({
   view = {
      adaptive_size = true,
      mappings = {
         list = {
            { key = "u", action = "dir_up" },
            { key = "<CR>", action = "tabnew" },
         },
      },
   },
   renderer = {
      group_empty = true,
   },
   filters = {
      dotfiles = true,
   },
})


-- open file tree
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

