-- List of language protocols to automatically install
local languageServers = {
	"sumneko_lua",
	"vimls",
	"clangd",
	"pyright",
	"jdtls",
	"html",
	"cssls",
	"tsserver",
	"bashls"
}

-- Automatic installation
local lspInstaller = require "nvim-lsp-installer.servers"
for _, l in pairs(languageServers) do
	local ok, s = lspInstaller.get_server(l)
	if ok then if not s:is_installed() then s:install() end end
end
