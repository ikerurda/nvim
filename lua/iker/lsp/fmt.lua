local languages = {
	lua = {{formatCommand = "lua-format -i", formatStdin = true}},
	python = {{formatCommand = "yapf", formatStdin = true}}
}

return function(opts)
	return vim.tbl_deep_extend("force", {
		filetypes = vim.tbl_keys(languages),
		init_options = {documentFormatting = true},
		root_dir = require"lspconfig".util.root_pattern {".git/", "."},
		settings = {languages = languages}
	}, opts)
end
