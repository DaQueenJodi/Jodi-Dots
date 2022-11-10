local lsp = require('lspconfig')
local coq = require("coq")
local opts = { noremap= true, silent = true }
local keymap = vim.api.nvim_set_keymap

for _,server in ipairs({"clangd", "rust_analyzer", "jsonls", "nil_ls"}) do
   lsp[server].setup(coq.lsp_ensure_capabilities{})
end

require "coq_3p" {
      {src = "nvimlua", short_name = nLUA, conf_only = false}
}


vim.g.coq_settings = {
   keymap = {
      recommended = true,
      pre_select = true,
      jump_to_mark = "<C-Tab>"
   },
  match = {max_results = 40},
   display = {
      pum = {
        fast_close = false,
        y_max_len = 25
      },
      icons = {mode = "none"},
   },
   auto_start = true,
   completion = {smart = false},
   limits = { completion_auto_timeout = 0.5 },
   clients = {
     lsp = { enabled = true},
     tree_sitter = { enabled = true},
     snippets = {enabled = false},
   }
}
-- since autostart doesnt work
vim.cmd('COQnow -s')
