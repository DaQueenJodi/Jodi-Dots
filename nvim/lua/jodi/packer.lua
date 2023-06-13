vim.cmd[[packadd packaer.nvim]]

return require('packer').startup(function(use)
	use('wbthomason/packer.nvim')
	use({
		'RRethy/nvim-base16',
		config = (function()
			vim.cmd([[colorscheme base16-atelier-dune]])
		end)
	})
	use('nvim-treesitter/nvim-treesitter', { run  = ':TSUpdate' })
	use({
		'https://github.com/frazrepo/vim-rainbow',
		config = (function()
			vim.g.rainbow_active = 0
		end)
	})
	use({'ziglang/zig.vim', config = (function() vim.g.zig_fmt_autosave = 0 end)})
	use('ThePrimeagen/vim-be-good')
	use('neovimhaskell/haskell-vim')
	use('LnL7/vim-nix')
end)


