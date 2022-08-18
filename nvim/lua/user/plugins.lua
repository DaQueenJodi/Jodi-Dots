local packer = require("packer")



return packer.startup(function(use)
      -- Plugins go here!
      

      -- lsp
      use {'neoclide/coc.nvim', run = 'yarn install --frozen-lockfile'}    -- bloat
      use 'rafcamlet/coc-nvim-lua'

      -- misc
      use {'preservim/nerdtree', run = 'yarn install --frozen-lockfile'}   -- file manager
      use {"akinsho/toggleterm.nvim", tag = 'v2.*', config = function()
            require("toggleterm").setup()
      end}

      -- themeing
      use 'drewtempelmeyer/palenight.vim'
   
   


      use 'wbthomason/packer.nvim'                                         -- get autoupdates for packer
   end)
