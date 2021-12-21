local has_tl, tl = pcall(require, "telescope")
if not has_tl then return end

require"project_nvim".setup {
	update_cwd = true,
	update_focused_file = {enable = true, update_cwd = true}
}

-- TODO: try to think of a way of setting this as theme = "..." (see https://github.com/nvim-telescope/telescope.nvim/issues/938)
local themes = require "telescope.themes"
local layout_actions = require("telescope.actions.layout")
-- FIXME: this is a hack to get the layout actions to work (will be fixed upstream)
-- FIXME: folder browser starts in cwd no current folder of telescope
local function fb_actions(f)
	return function(b) require"telescope".extensions.file_browser.actions[f](b) end
end
-- local fb_actions = require"telescope".extensions.file_browser.actions
tl.setup {
	defaults = themes.get_dropdown {
		winblend = 10,
		path_display = {"truncate"},
		mappings = {
			i = {
				["<esc>"] = "close",
				["<c-space>"] = layout_actions.toggle_preview
			}
		}
	},
	pickers = {
		oldfiles = {previewer = false},
		lsp_code_actions = {theme = "cursor"},
		buffers = {
			previewer = false,
			mappings = {
				i = {["<C-d>"] = "delete_buffer"},
				n = {["<C-d>"] = "delete_buffer"}
			}
		}
	},
	extensions = {
		fzf = {
			fuzzy = true,
			override_generic_sorter = true,
			override_file_sorter = true,
			case_mode = "smart_case"
		},
		file_browser = {
			previewer = false,
			mappings = {
				i = {
					["<M-d>"] = fb_actions "remove_file",
					["<M-y>"] = fb_actions "move_file",
					["<C-d>"] = "preview_scrolling_down"
				}
			}
		},
		packer = {
			theme = "ivy",
			previewer = false,
			layout_config = {height = .5, mirror = true, preview_width = .4}
		}
	}
}

-- FIXME: the fix disables :Telescope packer and other plugins' commands
tl.load_extension "fzf"
tl.load_extension "lsp_handlers"
tl.load_extension "file_browser"
tl.load_extension "projects"
tl.load_extension "packer"
