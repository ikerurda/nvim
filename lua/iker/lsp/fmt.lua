local languages = {
	lua = {{formatCommand = "lua-format -i", formatStdin = true}},
	python = {{formatCommand = "yapf", formatStdin = true}}
}

return function(opts)
    return vim.tbl_deep_extend("force", {
		init_options = {documentFormatting = true},
		settings = {rootMarkers = {".git/"}, languages = languages},
		filetypes = vim.tbl_keys(languages)
	}, opts)
end
