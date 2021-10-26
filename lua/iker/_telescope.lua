local telescope = require "telescope"
local trouble = require "trouble.providers.telescope"
telescope.setup {
	defaults = {mappings = {i = {["<c-q>"] = trouble.open_with_trouble}, n = {["<c-q>"] = trouble.open_with_trouble}}},
	pickers = {
		oldfiles = {theme = "dropdown", previewer = false},
		file_browser = {theme = "ivy", hidden = true},
		buffers = {
			theme = "dropdown",
			previewer = false,
			mappings = {i = {["<C-d>"] = "delete_buffer"}, n = {["<C-d>"] = "delete_buffer"}}
		},
		current_buffer_fuzzy_find = {theme = "dropdown"},
		find_files = {theme = "dropdown"},
		help_tags = {theme = "dropdown"},
		live_grep = {theme = "dropdown"}
	},
	extensions = {
		fzf = {
			fuzzy = true, -- false will only do exact matching
			override_generic_sorter = false,
			override_file_sorter = true,
			case_mode = "smart_case"
		},
		project = {hidden_files = true},
		files = {theme = "ivy", layout_config = {height = .5}},
		packer = {theme = "ivy", layout_config = {height = .5}}
	}
}

telescope.load_extension "fzf"
telescope.load_extension "project"
telescope.load_extension "dap"
telescope.load_extension "packer"
telescope.load_extension "files"
