local map = nvim_set_keymap

local cmp = require("cmp")
cmp.setup({
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end
	},
	mapping = cmp.mapping.preset.insert({
		['<C-d>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.abort(),
		['<C-y>'] = cmp.mapping.confirm({ select = true }),
	}),
	sources = cmp.config.sources({
		{
			name = 'nvim_lsp',
			priority = 1,
			max_view_entries = 10,
			max_item_count = 30
		},
		{ name = "buffer", priority = 2, max_item_count = 10 },
		{ name = "nvim_lsp_signature_help" }
	})
})

-- disable diagnostics
vim.lsp.handlers["textDocument/publishDiagnostics"] = function() end

local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()
local servers = { "clangd", "zls" }

for _, server_name in ipairs(servers) do
	lspconfig[server_name].setup({
		capabilities = lsp_capabilities
	})
end
