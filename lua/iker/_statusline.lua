vim.g.bufferline = {auto_hide = true, animation = false, icons = false}

require"lualine".setup {
	options = {
		icons_enabled = false,
		theme = "github",
		component_separators = {"", ""},
		section_separators = {"", ""},
		disabled_filetypes = {"NvimTree"}
	},
	sections = {
		lualine_a = {"mode"},
		lualine_b = {"branch", "diff"},
		lualine_c = {{"filename", path = 1}},
		lualine_x = {{"diagnostics", sources = {"nvim_lsp"}}},
		lualine_y = {"progress"},
		lualine_z = {"location"}
	}
}
