local configs = require('nvim-treesitter.configs')

configs.setup {
    sync_install = false,
    highlight = {enable = true, disable = {""}},
    indent = {enable = true},

    rainbow = {
        enable = true,
        extended_mode = true -- also hilight stuff like lists and html tags
    }
}
