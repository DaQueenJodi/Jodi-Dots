local opts = { noremap = true, silent = true}
local keymap = vim.api.nvim_set_keymap

keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--      normal       = "n"
--      insert       = "i"
--      visual       = "v"
--      visual block = "x"
--      command      = "c"

-- Normal --
-- Window Navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
-- close search
keymap("n", "<Esc>", ":noh<CR>", opts)

-- open file tree
keymap("n", "<leader>e", ":NERDTreeToggle<CR>", opts)
-- resizing windows
keymap("n", "<S-K>", ":resize -2<CR>", opts)
keymap("n", "<S-J>", ":resize +2<CR>", opts)
keymap("n", "<S-H>", ":vertical resize -2<CR>", opts)
keymap("n", "<S-L>", ":vertical resize +2<CR>", opts)

-- Visual --
-- Block Indenting
keymap("v", "<Tab>", ">gv", opts)
keymap("v", "<S-Tab>", "<gv", opts)

keymap("v", "<A-j>", ":m .+1<CR>==", opts) -- move text up
keymap("v", "<A-k>", ":m .-1<CR>==", opts) -- move text down
keymap("v", "p", '"_dP', opts) -- hack to make pasting in visual mode normal

-- requires neoformat plugin
keymap("n", "<leader>f", ":Neoformat<CR>", opts)
