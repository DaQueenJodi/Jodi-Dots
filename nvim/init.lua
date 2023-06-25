require("mappings")
require("options")
require("plugins")
require("lsp")
require("gruvbox").setup({
	undercurl = false;
	underline = false;
	bold = false;
	strikethrough = false;
	italic = {
		strings = false;
		comments = false;
		folds = false;
	}
})
vim.cmd("colorscheme gruvbox")

require("nvim-treesitter.configs").setup({
	ensure_installed = { "bash", "c", "vim", "vimdoc", "lua", "zig", "nix" },
	highlight = { enable = true },
	indent = { enable = true },
	textobjects = { enable = true },
	rainbow = {
		enable = false,
		extended_mode = true
	}
})
