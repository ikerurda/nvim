local builtin = require "el.builtin"
local extensions = require "el.extensions"
local sections = require "el.sections"
local subscribe = require "el.subscribe"

local git_branch = subscribe.buf_autocmd("el_git_branch", "BufEnter", function(window, buffer)
	local branch = extensions.git_branch(window, buffer)
	if branch then return " " .. branch end
end)

local function lsp_info()
	local warnings = vim.lsp.diagnostic.get_count(0, "Warning")
	local errors = vim.lsp.diagnostic.get_count(0, "Error")
	local hints = vim.lsp.diagnostic.get_count(0, "Hint")
	return string.format("[H:%d, W:%d, E:%d]", hints, warnings, errors)
end

local changes = function(window, buffer)
	local changes = extensions.git_changes(window, buffer)
	if changes then return changes end
end
local git_changes = subscribe.buf_autocmd("el_git_changes", "BufWritePost", changes)

local mode = sections.highlight("StatusLine", extensions.gen_mode {format_string = " %s "})

require("el").setup {
	generator = function()
		return {
			mode,
			git_branch,
			" ",
			sections.split,
			sections.maximum_width(builtin.responsive_file(140, 90), 0.40),
			sections.collapse_builtin {{" ", {builtin.modified_flag}}},
			sections.split,
			lsp_info,
			git_changes,
			"[",
			builtin.line_with_width(3),
			":",
			builtin.column_with_width(2),
			"][",
			builtin.percentage_through_file,
			"%%]",
			sections.collapse_builtin {"[", builtin.help_list, builtin.readonly_list, "]"},
			builtin.quickfix
		}
	end
}
