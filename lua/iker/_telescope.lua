require("project_nvim").setup {
	update_cwd = true,
	update_focused_file = {enable = true, update_cwd = true, ignore_lsp = {"efm"}}
}

local telescope = require "telescope"
telescope.setup {
	pickers = {
		file_browser = {
			theme = "ivy",
			layout_config = {height = .5},
			mappings = {i = {["<C-t>"] = function() print("hi") end}}
		},
		oldfiles = {theme = "dropdown", previewer = false},
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
			override_generic_sorter = true,
			override_file_sorter = true,
			case_mode = "smart_case"
		},
		packer = {theme = "ivy", layout_config = {height = .5}},
		project = {hidden_files = true}
	}
}

telescope.load_extension "fzf"
-- telescope.load_extension "project"
telescope.load_extension "projects"
telescope.load_extension "dap"
telescope.load_extension "packer"
