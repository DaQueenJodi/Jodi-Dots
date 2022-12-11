local packer = require("packer")

return packer.startup(function(use)
    -- lsp/completion/linting
    use {'folke/trouble.nvim', require = 'kyazdani42/nvim-web-devicons'}
    use 'neovim/nvim-lspconfig'
    use {'weilbith/nvim-code-action-menu', cmd = 'CodeActionMenu'}
    -- completion
    -- CMP
    use 'hrsh7th/cmp-nvim-lua'
    use 'saadparwaiz1/cmp_luasnip'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-nvim-lsp-signature-help'
    use 'hrsh7th/cmp-buffer'
    -- COQ
    use {'ms-jpq/coq_nvim', branch = 'coq'}
    use {'ms-jpq/coq.artifacts', branch = 'artifacts'}
    use {'ms-jpq/coq.thirdparty', branch = '3p'}
    -- snippets
    use 'rafamadriz/friendly-snippets'
    use 'L3MON4D3/LuaSnip'
    -- linting
    use 'mfussenegger/nvim-lint'
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
    use 'sbdchd/neoformat' -- formatting
    use 'NvChad/nvim-colorizer.lua'
    -- Lisp
    use 'kovisoft/slimv'
    use 'bhurlow/vim-parinfer'
    use {'p00f/nvim-ts-rainbow', require = 'nvim-treesitter/nvim-treesitter'}

    -- Misc Langs
    use 'tikhomirov/vim-glsl'
    use 'LnL7/vim-nix' -- nixos uwu
    use 'simrat39/rust-tools.nvim'

    -- files
    use 'nvim-telescope/telescope.nvim'

    use 'nvim-telescope/telescope-fzf-native.nvim'
    use 'kyazdani42/nvim-tree.lua' -- file manager

    -- misc
    use 'akinsho/toggleterm.nvim'
    use 'numToStr/Comment.nvim'
    use 'windwp/nvim-autopairs' -- automatic bracket/paranthesis/etc pairing

    use 'nvim-lualine/lualine.nvim'
    use 'WhoIsSethDaniel/lualine-lsp-progress.nvim'
    use 'j-hui/fidget.nvim'

    use {'saecki/crates.nvim', requires = 'nvim-lua/plenary.nvim'}

    -- themeing
    use 'drewtempelmeyer/palenight.vim'
    use {'catppuccin/nvim', as = 'catppuccin'}
    use 'tanvirtin/monokai.nvim'
    use 'folke/tokyonight.nvim'
    use 'Yazeed1s/oh-lucy.nvim'

    -- deps
    use 'nvim-lua/plenary.nvim'

    -- use {'williamboman/mason.nvim', 'williamboman/mason-lspconfig.nvim'}

    use 'wbthomason/packer.nvim' -- get autoupdates for packer
end)
