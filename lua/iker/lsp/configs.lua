local nvim_status = require "lsp-status"
require"iker.lsp.status".activate()

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = vim.tbl_deep_extend("keep", capabilities, nvim_status.capabilities)
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

local on_attach = function(client, bufnr)
	local function map(m, k, c) vim.api.nvim_buf_set_keymap(bufnr, m, k, c, {noremap = true, silent = true}) end
	nvim_status.on_attach(client)

	map("n", "ga", "<cmd>lua vim.lsp.buf.code_action()<cr>") -- Actions
	map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>") -- Definition
	map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>") -- Declaration
	map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>") -- Implementation
	map("n", "gR", "<cmd>lua vim.lsp.buf.references()<CR>") -- References
	map("n", "gp", "<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>") -- Go to next diagnostic
	map("n", "gn", "<cmd>lua vim.lsp.diagnostic.goto_next()<cr>") -- Go to prev diagnostic
	map("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>") -- Hover info
	map("i", "<c-s>", "<cmd> lua vim.lsp.buf.signature_help()<cr>")
	map("n", "<c-l>", "<cmd>LspStop<cr>")

	vim.bo.omnifunc = "v:lua.vim.lsp.omnifunc"

	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
end

-- Configs for the language servers
local general = {capabilities = capabilities, on_attach = on_attach}
local lua = require"lua-dev".setup {library = {vimruntime = true, types = true, plugins = true}, lspconfig = general}
local clangd = vim.tbl_deep_extend("force", {
	init_options = {clangdFileStatus = true},
	handlers = nvim_status.extensions.clangd.setup()
}, general)
local efm = require "iker.lsp.fmt"(general)

return {general = general, sumneko_lua = lua, clangd = clangd, efm = efm}
