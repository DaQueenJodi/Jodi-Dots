local configs = require('nvim-treesitter.configs')

local parser_configs = require('nvim-treesitter.parsers').get_parser_configs()

vim.filetype.add({extension = {wgsl = "wgsl"}})

parser_configs.wgsl = {
    install_info = {
        url = "https://github.com/szebniok/tree-sitter-wgsl",
        files = {"src/parser.c"}
    }
}
configs.setup {
    ensure_installed = {"wgsl", "rust", "c", "lua"},
    highlight = {enable = true},
    rainbow = {
        enable = true,
        extended_mode = true -- also hilight stuff like lists and html tags
    }
}
