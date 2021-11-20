local has_tl, tl = pcall(require, "telescope")
if not has_tl then return end

-- This will be removed when https://github.com/nvim-telescope/telescope-file-browser.nvim/pull/6 is fixed
local function fb_action(f) return function(b) require"telescope".extensions.file_browser.actions[f](b) end end

require"project_nvim".setup {
	update_cwd = true,
	update_focused_file = {enable = true, update_cwd = true, ignore_lsp = {"efm"}}
}

tl.setup {
	defaults = {winblend = 10},
	pickers = {
		find_files = {theme = "dropdown"},
		oldfiles = {theme = "dropdown", previewer = false},
		current_buffer_fuzzy_find = {theme = "dropdown"},
		help_tags = {theme = "dropdown"},
		live_grep = {theme = "dropdown"},
		buffers = {
			theme = "dropdown",
			previewer = false,
			mappings = {i = {["<C-d>"] = "delete_buffer"}, n = {["<C-d>"] = "delete_buffer"}}
		}
	},
	extensions = {
		fzf = {fuzzy = true, override_generic_sorter = true, override_file_sorter = true, case_mode = "smart_case"},
		file_browser = {
			theme = "ivy",
			layout_config = {height = .5},
			mappings = {
				i = {["<C-v>"] = fb_action "move_file", ["<C-x>"] = fb_action "remove_file", ["<C-d>"] = "preview_scrolling_down"}
			}
		},
		packer = {theme = "ivy", layout_config = {height = .5}}
	}
}
tl.load_extension "fzf"
tl.load_extension "file_browser"
tl.load_extension "projects"
tl.load_extension "packer"
