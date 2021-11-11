local has_ts, ts = pcall(require, "nvim-treesitter.configs")
if not has_ts then return end

ts.setup {
	ensure_installed = {"lua", "vim", "c", "python", "java", "html", "css", "javascript", "bash"},
	highlight = {enable = true, use_languagetree = false, additional_vim_regex_highlighting = false},

	refactor = {
		highlight_definitions = {enable = true},
		highlight_current_scope = {enable = false},
		smart_rename = {enable = true, keymaps = {smart_rename = "gr"}}
	},

	incremental_selection = {
		enable = true,
		keymaps = {init_selection = "gs", node_incremental = "gsi", node_decremental = "gsd"}
	},

	textobjects = {
		select = {
			enable = true,
			lookahead = true,
			keymaps = {
				["af"] = "@function.outer",
				["if"] = "@function.inner",

				["ac"] = "@conditional.outer",
				["ic"] = "@conditional.inner",

				["aa"] = "@parameter.outer",
				["ia"] = "@parameter.inner"
			}
		},
		swap = {
			enable = true,
			swap_next = {["<leader>a"] = "@parameter.inner"},
			swap_previous = {["<leader>A"] = "@parameter.inner"}
		},
		move = {
			enable = true,
			set_jumps = true,
			goto_next_start = {["]m"] = "@function.outer", ["]]"] = "@class.outer"},
			goto_next_end = {["]M"] = "@function.outer", ["]["] = "@class.outer"},
			goto_previous_start = {["[m"] = "@function.outer", ["[["] = "@class.outer"},
			goto_previous_end = {["[M"] = "@function.outer", ["[]"] = "@class.outer"}
		},
		lsp_interop = {
			enable = true,
			border = "none",
			peek_definition_code = {["<leader>df"] = "@function.outer", ["<leader>dF"] = "@class.outer"}
		}
	}
}
