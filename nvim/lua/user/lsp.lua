local opts = {noremap = true, silent = true}
-- native lsp
vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
vim.keymap.set("n", "gm", vim.lsp.buf.rename, opts)
vim.keymap.set("n", "<space><space>", vim.lsp.buf.hover, opts)
vim.keymap.set("n", "C-k", vim.lsp.buf.signature_help, opts)
-- vim.keymap.set("n", "C-l", vim.lsp.diagnostic.goto_prev, opts)
-- vim.keymap.set("n", "C-h", vim.lsp.diagnostic.goto_next, opts)
-- requires nvim-code-action-menu plugin
vim.api.nvim_set_keymap("n", "ga", ":CodeActionMenu<CR>", opts);
-- NOTE: the lsp servers in use are declared in completion.lua

-- display diagnostics on hover
vim.api.nvim_create_autocmd("CursorHold", {
    buffer = bufnr,
    callback = function()
        local opts = {
            focusable = false,
            close_events = {
                "BufLeave", "CursorMoved", "InsertEnter", "FocusLost"
            },
            border = 'rounded',
            source = 'always',
            prefix = ' ',
            scope = 'cursor'
        }
        vim.diagnostic.open_float(nil, opts)
    end
})

-- turn off virtual text
vim.diagnostic.config({virtual_text = false})

-- make diagnostic icons look nicer
local signs = {
    Error = "",
    Warning = "",
    Hint = "",
    Information = ""
}

for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, {text = icon, texthl = hl, numhl = hl})
end
