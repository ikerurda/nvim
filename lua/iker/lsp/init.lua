require "iker.lsp.install"

local configs = require "iker.lsp.configs"
require"nvim-lsp-installer".on_server_ready(function(server)
	local config = configs.general()
	if server.name == "sumneko_lua" then
		config = configs.lua(config)
	elseif server.name == "efm" then
		config = configs.fmt(config)
	end

	server:setup(config)
	vim.cmd "do User LspAttachBuffers"
end)

-- Disable diagnostic updates in insert mode
vim.lsp.handlers["textDocument/publishDiagnostics"] = function(...)
	vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {update_in_insert = false})(...)
end

require"nvim-autopairs".setup {}
