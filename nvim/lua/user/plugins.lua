local packer = require("packer")



return packer.startup(function(use)
      -- Plugins go here!
      

      -- lsp/completion/linting
      use {'neoclide/coc.nvim', branch = 'release'} -- bloat
      use 'rafcamlet/coc-nvim-lua'
      use {'nvim-treesitter/nvim-treesitter'  , run = ':TSUpdate'}
      use 'LnL7/vim-nix'      
      -- files
      use 'nvim-telescope/telescope.nvim'

      use 'nvim-telescope/telescope-fzf-native.nvim'
      use 'kyazdani42/nvim-tree.lua'  -- file manager
      use 'kyazdani42/nvim-web-devicons' -- icons for nvim-tree

      -- misc
      use 'akinsho/toggleterm.nvim'
      use 'gentoo/gentoo-syntax'

      use 'windwp/nvim-autopairs' -- automatic bracket/paranthesis/etc pairing 
      -- themeing
      use 'drewtempelmeyer/palenight.vim'

      -- deps
      use 'nvim-lua/plenary.nvim'



      use 'wbthomason/packer.nvim'                                         -- get autoupdates for packer
   end)
