local has_lsp, lsp = pcall(require, "lspconfig")
if not has_lsp then return end

require "iker.lsp.install"
require"nvim-autopairs".setup {}

-- Apply configs
local installer = require("nvim-lsp-installer")
local configs = require "iker.lsp.configs"
installer.on_server_ready(function(server)
	if configs[server.name] then
		server:setup(configs[server.name])
	else
		server:setup(configs.general)
	end
	vim.cmd "do User LspAttachBuffers"
end)

lsp["null-ls"].setup(configs.general)

-- Disable diagnostic updates in insert mode
vim.lsp.handlers["textDocument/publishDiagnostics"] = function(...)
	vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {update_in_insert = false})(...)
end
