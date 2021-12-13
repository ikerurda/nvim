local has_installer, installer = pcall(require, "nvim-lsp-installer")
if not has_installer then return end

-- Automatically install missing lsp
require "iker.lsp.install"

-- Apply configs
local configs = require "iker.lsp.configs"
installer.on_server_ready(function(server)
	if configs[server.name] then
		server:setup(configs[server.name])
	else
		server:setup(configs.general)
	end
	vim.cmd "do User LspAttachBuffers"
end)

-- Disable diagnostic updates in insert mode
vim.lsp.handlers["textDocument/publishDiagnostics"] = function(...)
	vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {update_in_insert = false})(...)
end
