local opts = { noremap = true, silent = true}
local keymap = vim.api.nvim_set_keymap

local npairs = require("nvim-autopairs")



npairs.setup({
   map_cr = false
})


_G.MUtils= {}

MUtils.completion_confirm=function()
    if vim.fn["coc#pum#visible"]() ~= 0  then
        return vim.fn["coc#pum#confirm"]()
    else
        return npairs.autopairs_cr()
    end
end

keymap('i' , '<CR>','v:lua.MUtils.completion_confirm()', {expr = true , noremap = true})
