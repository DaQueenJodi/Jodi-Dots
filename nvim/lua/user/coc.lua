local keymap = vim.api.nvim_set_keymap
local expr_opts = { noremap = true, silent = true, expr = true}

keymap(
    "i",
    "<CR>",
    [[ coc#pum#visible() ? coc#_select_confirm() : "\<C-g>u\<CR>" ]],
    expr_opts
)

keymap(
   "i",
   "<Tab>",
   [[ coc#pum#visible() ? coc#pum#next(1) : "\<Tab>" ]],
   expr_opts
)

keymap(
   "i",
   "<S-Tab>",
   [[ coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>" ]],
   expr_opts
)

keymap(
   "n",
   "gd",
   "<Plug>(coc-definition)",
   {}
)


keymap(
   "n",
   "gy",
   "<Plug>(coc-type-definition)",
   {}
)

keymap(
   "n",
   "gi",
   "<Plug>(coc-implimentation)",
   {}
)

keymap(
   "n",
   "gr",
   "<Plug>(coc-references)",
   {}
)
keymap(
   "n",
   "gm",
   "<Plug>(coc-rename)",
   {}
)
