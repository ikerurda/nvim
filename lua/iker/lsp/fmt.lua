local languages = {
	lua = {{formatCommand = "lua-format -i", formatStdin = true}},
	python = {{formatCommand = "yapf", formatStdin = true}}
}

return function(opts)
	opts.init_options = {documentFormatting = true}
	opts.settings = {rootMarkers = {".git/"}, languages = languages}
	opts.filetypes = vim.tbl_keys(languages)
	return opts
end
