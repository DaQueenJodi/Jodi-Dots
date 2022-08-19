local packer = require("packer")



return packer.startup(function(use)
      -- Plugins go here!
      

      -- lsp
      use {'neoclide/coc.nvim', run = 'yarn install --frozen-lockfile'}    -- bloat
      --use {'ms-jpq/coq_nvim', branch = 'coq'}
      use 'rafcamlet/coc-nvim-lua'

      -- misc
      use 'kyazdani42/nvim-tree.lua'  -- file manager
      use 'kyazdani42/nvim-web-devicons' -- icons for nvim-tree
      use 'akinsho/toggleterm.nvim'

      use 'windwp/nvim-autopairs' -- automatic bracket/paranthesis/etc pairing 
      -- themeing
      use 'drewtempelmeyer/palenight.vim'

      
      use 'wbthomason/packer.nvim'                                         -- get autoupdates for packer
   end)
