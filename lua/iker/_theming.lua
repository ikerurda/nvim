require"github-theme".setup {
	theme_style = "dark_default",
	sidebars = {"qf", "which_key", "toggleterm"},
	hide_inactive_statusline = false
}

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
