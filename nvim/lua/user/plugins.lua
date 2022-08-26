local packer = require("packer")



return packer.startup(function(use)
      -- Plugins go here!
      

      -- lsp/completion/linting
      use {'neoclide/coc.nvim', run = 'yarn install --frozen-lockfile'}    -- bloat
      use 'rafcamlet/coc-nvim-lua'
      use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
      
      -- files
      use 'nvim-telescope/telescope.nvim'

      use {'nvim-telescope/telescope-fzf-native.nvim', run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
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
