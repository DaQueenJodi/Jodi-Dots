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
        ['<CR>'] = cmp.mapping.confirm({select = true}),
    }),
    sources = cmp.config.sources({
        {name = 'nvim_lsp', keyword_length = 1},
        {name = 'luasnip', keyword_length = 2}
    }, { {name = "path", keyword_length = 0}, {name = 'buffer', keyword_length = 3}, {name = "nvim_lua", keyword_length = 0}
    })
})

cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({{name = 'cmp_git'}}, {{name = 'buffer'}})
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
require('lspconfig')['clangd'].setup {capabilities = capabilities}
require('lspconfig')['csharp_ls'].setup {capabilities = capabilities}
require('lspconfig')['jsonls'].setup {capabilities = capabilities}
require('lspconfig')['rust_analyzer'].setup {capabilities = capabilities}
require('lspconfig')['sumneko_lua'].setup {capabilities = capabilities}
require('lspconfig')['nil_ls'].setup {capabilities = capabilities}
