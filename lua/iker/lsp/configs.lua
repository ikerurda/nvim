-- Setup lsp status
local nvim_status = require "lsp-status"
require"iker.lsp.status".activate()

-- Setup null-ls
local null = require "null-ls"
null.config {
	sources = {
		null.builtins.code_actions.gitsigns,
		null.builtins.formatting.lua_format,
	}
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = vim.tbl_deep_extend("keep", capabilities, nvim_status.capabilities)
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

local on_attach = function(client, bufnr)
	local function map(m, k, c) vim.api.nvim_buf_set_keymap(bufnr, m, k, c, {noremap = true, silent = true}) end
	nvim_status.on_attach(client)

	-- Buffer mappings
	map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>") -- Definition
	map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>") -- Declaration
	map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>") -- Implementation
	map("n", "gR", "<cmd>Telescope lsp_references theme=dropdown<CR>") -- References
	map("n", "gp", "<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>") -- Go to next diagnostic
	map("n", "gn", "<cmd>lua vim.lsp.diagnostic.goto_next()<cr>") -- Go to prev diagnostic
	map("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>") -- Hover info
	map("i", "<c-s>", "<cmd>lua vim.lsp.buf.signature_help()<cr>") -- Show signature help
	map("n", "<leader>ca", "<cmd>Telescope lsp_code_actions theme=cursor<cr>") -- Actions
	map("n", "<leader>cf", "<cmd>lua vim.lsp.buf.formatting_sync(nil, 1000)<CR>") -- Format
	map("v", "<leader>cf", "<cmd>lua vim.lsp.buf.range_formatting()<CR>") -- Format selection
end

-- Configs for the language servers
local general = {capabilities = capabilities, on_attach = on_attach}
local lua = require"lua-dev".setup {library = {vimruntime = true, types = true, plugins = true}, lspconfig = general}
local clangd = vim.tbl_deep_extend("force", {
	init_options = {clangdFileStatus = true},
	handlers = nvim_status.extensions.clangd.setup()
}, general)

return {general = general, sumneko_lua = lua, clangd = clangd}
