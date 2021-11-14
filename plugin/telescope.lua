local has_tl, tl = pcall(require, "telescope")
if not has_tl then return end

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
		file_browser = {
			theme = "ivy",
			layout_config = {height = .5},
			mappings = {i = {["<C-v>"] = "move_file", ["<C-x>"] = "remove_file", ["<C-d>"] = "preview_scrolling_down"}}
		},
		buffers = {
			theme = "dropdown",
			previewer = false,
			mappings = {i = {["<C-d>"] = "delete_buffer"}, n = {["<C-d>"] = "delete_buffer"}}
		}
	},
	extensions = {
		fzf = {fuzzy = true, override_generic_sorter = true, override_file_sorter = true, case_mode = "smart_case"},
		packer = {theme = "ivy", layout_config = {height = .5}},
		["ui-select"] = {require("telescope.themes").get_cursor {}}
	}
}
tl.load_extension "fzf"
tl.load_extension "ui-select"
tl.load_extension "projects"
tl.load_extension "packer"
