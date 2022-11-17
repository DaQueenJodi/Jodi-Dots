local cmp = require('cmp')
local luasnip = require('luasnip')

vim.opt.completeopt = {'menu', 'menuone', 'noselect'}

local select_opts = {behavior = cmp.SelectBehavior.Select}

cmp.setup({
    snippet = {
        expand = function(args) require('luasnip').lsp_expand(args.body) end
    },
    mapping = cmp.mapping.preset.insert({
        ['<Tab>'] = cmp.mapping.select_next_item(select_opts),
        ['S-<Tab>'] = cmp.mapping.select_prev_item(select_opts),
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({select = true})
    }),
    sources = cmp.config.sources({
        {name = 'nvim_lsp'}, {name = 'luasnip'}, {name = "path"},
        {name = 'buffer'}, {name = "nvim_lua"}
    })
})

-- Use buffer source for '/' and '?'
cmp.setup.cmdline({'/', '?'}, {
    mapping = cmp.mapping.preset.cmdline(),
    source = {sources = {{name = 'buffer'}}}
})

-- use cmdline & path source for ':'
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({{name = 'path'}}, {{name = 'cmdline'}})
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()

local servers = {"clangd", "rust_analyzer", "jsonls", "nil_ls"};

for _, server in ipairs(servers) do
    require("lspconfig")[server].setup {capabilities = capabilities}
end
