vim.opt.backup = false 					-- dont create  automatic backups
vim.opt.clipboard = "unnamedplus" 			-- use system clipboard
vim.opt.cmdheight = 1; 					-- space for command messages
vim.opt.completeopt = { "menuone", "noselect" }
vim.opt.fileencoding = "utf-8" 				-- because every other encoding is ass
vim.opt.hlsearch = true 				-- highlight search
vim.opt.ignorecase = true     				-- ignore case
--vim.opt.mouse = "a" 					-- mouse support
vim.opt.smartindent = true
vim.opt.number = true 					-- line numbers
vim.opt.relativenumber = false 				-- ew
vim.opt.expandtab = true 				-- make all tabs spaces 
vim.opt.signcolumn = "yes"
vim.opt.scrolloff = 8 					-- keeps the cursor more centured
vim.opt.sidescrolloff = 8 				-- same thing but for sides obviously
vim.pumheight = 10 					-- popup menu height
vim.opt.swapfile = false 				-- dont use swap file since they suck
vim.opt.shortmess:append "mnrw" 			-- shorten file status messages
vim.opt.whichwrap:append "<,>,[,],h,l" 			-- enable wrap around for some movement keys
vim.opt.iskeyword:append "-" 				-- dont treat '-' as a word seperator

