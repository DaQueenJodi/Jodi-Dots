local npairs = require("nvim-autopairs")
local enable_bracket_in_quote = true
local disable_in_macro = true

npairs.setup({
  enable_bracket_in_quote = false,
  disable_in_macro = true,
})

local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local cmp = require('cmp')
cmp.event:on(
  'confirm_done',
  cmp_autopairs.on_confirm_done{map_char = { tex = "" }}
)
