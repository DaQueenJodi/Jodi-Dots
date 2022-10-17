local opts = {noremap = true, silent = true}

vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
vim.keymap.set("n", "gm", vim.lsp.buf.rename, opts)
vim.keymap.set("n", "<space><space>", vim.lsp.buf.hover, opts)
vim.keymap.set("n", "C-k", vim.lsp.buf.signature_help, opts)
vim.keymap.set("n", "C-l", vim.lsp.diagnostic.goto_prev, opts)
vim.keymap.set("n", "C-h", vim.lsp.diagnostic.goto_next, opts)
-- requires nvim-code-action-menu plugin
vim.api.nvim_set_keymap("n", "gc", ":CodeActionMenu<CR>", opts);
