local has_ll, ll = pcall(require, "lualine")
if not has_ll then return end

local colors = {
	fg = "#c9d1d9",
	bg = "#0d1117",
	blue = "#58a6ff",
	darker_blue = "#161f2e"
}

local my_theme = {
	normal = {
		a = {bg = colors.blue, fg = colors.bg, gui = "bold"},
		b = {bg = colors.blue, fg = colors.bg},
		c = {bg = colors.blue, fg = colors.bg}
	},
	inactive = {
		a = {bg = colors.darker_blue, fg = colors.fg},
		b = {bg = colors.darker_blue, fg = colors.fg},
		c = {bg = colors.darker_blue, fg = colors.fg}
	}
}

ll.setup {
	options = {
		theme = my_theme,
		icons_enabled = false,
		component_separators = "",
		section_separators = ""
	},
	sections = {
		lualine_a = {"mode"},
		lualine_b = {
			"branch",
			{
				"diff",
				colored = false,
				symbols = {added = "+", modified = "~", removed = "-"}
			}
		},
		lualine_c = {
			"%=",
			{
				"filename",
				file_status = true,
				path = 1,
				shorting_target = 40,
				symbols = {modified = ",+", readonly = ",-"}
			}
		},
		lualine_x = {
			{
				"diagnostics",
				sources = {"nvim_diagnostic"},
				sections = {"error", "warn", "info", "hint"},
				symbols = {error = "E", warn = "W", info = "I", hint = "H"},
				colored = false,
				update_in_insert = false,
				always_visible = false
			}
		},
		lualine_y = {"progress"},
		lualine_z = {"%l/%L:%c"}
	},
	inactive_sections = {
		lualine_c = {
			{
				"filename",
				file_status = true,
				path = 1,
				shorting_target = 40,
				symbols = {modified = ",+", readonly = ",-"}
			}
		}
	}
}
