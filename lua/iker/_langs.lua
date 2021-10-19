-- Bootstrap
local languageServers = {
	"efm",
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
local parsers = {"lua", "vim", "c", "python", "java", "html", "css", "javascript", "bash"}
local debuggers = {"python"}

--- LSP server installation
local lspInstaller = require "nvim-lsp-installer.servers"
for _, l in pairs(languageServers) do
	local ok, s = lspInstaller.get_server(l)
	if ok then if not s:is_installed() then s:install() end end
end
--- Treesitter parser installation
require"nvim-treesitter.configs".setup {
	ensure_installed = {parsers},
	highlight = {enable = true, additional_vim_regex_highlighting = false}
}
--- DAP adapter installation
local dap = require("dap")
local dapInstall = require("dap-install")
local dapInstalled = require("dap-install.api.debuggers").get_installed_debuggers()
for _, l in pairs(debuggers) do
	if vim.tbl_contains(dapInstalled, l) then
		dapInstall.config(l, {})
	else
		vim.cmd("silent DIInstall " .. l)
	end
end
dap.adapters.lldb = {type = "executable", command = "/usr/local/bin/lldb-vscode", name = "lldb"}
dap.configurations.c = {
	{
		name = "Launch",
		type = "lldb",
		request = "launch",
		program = function() return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file") end,
		cwd = "${workspaceFolder}",
		stopOnEntry = false,
		args = {},
		runInTerminal = false
	}
}

-- Formatting
local luafmt = {formatCommand = "lua-format -i", formatStdin = true}
local black = {formatCommand = "black --quiet -", formatStdin = true}
local languages = {lua = {luafmt}, python = {black}}

-- Configs
local function make_opts()
	local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)
	return {
		capabilities = capabilities,
		on_attach = function(bufnr) vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc") end
	}
end
local function lua_opts(opts)
	return require("lua-dev").setup({library = {vimruntime = true, types = true, plugins = true}, lspconfig = opts})
end
local function efm_opts(opts)
	opts.root_dir = require"lspconfig".util.root_pattern(".git")
	opts.filetypes = vim.tbl_keys(languages)
	opts.init_options = {documentFormatting = true, codeAction = true}
	opts.settings = {languages = languages, log_level = 1, log_file = "~/efm.log"}
	return opts
end

-- LSPs
require("nvim-lsp-installer").on_server_ready(function(server)
	local opts = make_opts()
	if server.name == "sumneko_lua" then
		opts = lua_opts(opts)
	elseif server.name == "efm" then
		opts = efm_opts(opts)
	end

	server:setup(opts)
	vim.cmd [[ do User LspAttachBuffers ]]
end)

-- Completion
local luasnip = require "luasnip"
local cmp = require "cmp"
cmp.setup({
	snippet = {expand = function(args) luasnip.lsp_expand(args.body) end},
	mapping = {
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-c>"] = cmp.mapping.close(),
		["<C-p>"] = cmp.mapping.select_prev_item(),
		["<C-n>"] = cmp.mapping.select_next_item(),
		["<C-u>"] = cmp.mapping.scroll_docs(-4),
		["<C-d>"] = cmp.mapping.scroll_docs(4)
	},
	sources = {
		{name = "nvim_lsp"},
		{name = "nvim_lua"},
		{name = "luasnip"},
		{name = "buffer"},
		{name = "path"},
		{name = "calc"},
		{name = "spell"}
	}
})
local t = function(str) return vim.api.nvim_replace_termcodes(str, true, true, true) end
_G.tab_complete = function() return t "<Plug>luasnip-expand-or-jump" end
_G.s_tab_complete = function() return t "<Plug>luasnip-jump-prev" end
vim.api.nvim_set_keymap("i", "<C-j>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<C-j>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<C-k>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<C-k>", "v:lua.s_tab_complete()", {expr = true})

-- Signature
require"lsp_signature".setup({
	bind = true,
	doc_lines = 10,
	floating_window = true,
	fix_pos = true,
	hint_enable = false,
	handler_opts = {border = "none"}
})

-- Disable diagnostic updates in insert mode
vim.lsp.handlers["textDocument/publishDiagnostics"] = function(...)
	vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {update_in_insert = false})(...)
end
