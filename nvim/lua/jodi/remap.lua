vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Explore)
vim.keymap.set("n", "<C-x>", vim.cmd.terminal)
vim.keymap.set("n", "<leader>x", function()
	vim.cmd("!%:p")
end)
vim.keymap.set("n", "t", function()
	local name = vim.fn.input("Tab Name >")
	vim.cmd.tabnew(name)
end)
-- mappings for command mode to behave more like readline


local keymap = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }
local expr_opts = { noremap = true, expr = true, silent = true }

local sides = {"<left>", "<right>", "<up>", "<down>"}
local modes = {"n", "i", "v"}
for _,side in ipairs(sides) do
	for _,mode in ipairs(modes) do
		keymap(mode, side,  "<nop>", default_opts)
	end
end

keymap("i", "<ESC>", "<nop>", default_opts)
keymap("t", "<Esc>", [[<C-\><C-n>]], default_opts)
