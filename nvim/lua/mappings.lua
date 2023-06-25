local map = vim.keymap.set

allModes = { "n", "v", "c", "i" }

map("n", "<C-u>", "<C-u>zz", {silent = true})
map("n", "<C-d>", "<C-d>zz")
map("n", "gb", ":bnext<CR>")
map("n", "gB", ":bprevious<CR>")
map("n", "gn", ":next<CR>")
map("n", "gN", ":previous<CR>")
map("n", "<C-x>", ":terminal<CR>");
map("c", "<C-p>", "<Up>");
map("c", "<C-n>", "<Down>");
map("c", "<C-b>", "<Left>");
map("c", "<C-f>", "<Right>");
map(allModes, "<C-c>", "<Esc>");

map("n", "<C-k>", ":Man<CR>");
