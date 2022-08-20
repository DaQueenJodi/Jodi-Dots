local packer = require("packer")



return packer.startup(function(use)
      -- Plugins go here!
      

      -- lsp/completion/linting
      use {'neoclide/coc.nvim', run = 'yarn install --frozen-lockfile'}    -- bloat
      use 'rafcamlet/coc-nvim-lua'
      use 'brenoprata10/nvim-highlight-colors'

      -- misc
      use 'kyazdani42/nvim-tree.lua'  -- file manager
      use 'kyazdani42/nvim-web-devicons' -- icons for nvim-tree
      use 'akinsho/toggleterm.nvim'
      use 'gentoo/gentoo-syntax'


      use 'windwp/nvim-autopairs' -- automatic bracket/paranthesis/etc pairing 
      -- themeing
      use 'drewtempelmeyer/palenight.vim'

      
      use 'wbthomason/packer.nvim'                                         -- get autoupdates for packer
   end)
