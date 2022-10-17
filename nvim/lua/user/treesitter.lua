local configs = require('nvim-treesitter.configs')

configs.setup {
    sync_install = false,
    highlight = {enable = true, disable = {""}},
    indent = {enable = true}
}
