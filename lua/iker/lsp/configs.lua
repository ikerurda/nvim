-- Configs for the language servers
return {
	general = function()
		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = require"cmp_nvim_lsp".update_capabilities(capabilities)
		return {
			capabilities = capabilities,
			on_attach = function(bufnr) vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc") end
		}
	end,

	lua = function(opts)
		return require"lua-dev".setup {library = {vimruntime = true, types = true, plugins = true}, lspconfig = opts}
	end,

	fmt = require "iker.lsp.fmt"
}
