vim.cmd[[packadd packaer.nvim]]

return require('packer').startup(function(use)
	use('wbthomason/packer.nvim')
	use('RRethy/nvim-base16')
	use('nvim-treesitter/nvim-treesitter', { run  = ':TSUpdate' })
	use({
		'https://github.com/frazrepo/vim-rainbow',
		config = (function()
			vim.g.rainbow_active = 0
		end)
	})
	use('ThePrimeagen/vim-be-good')
end)


