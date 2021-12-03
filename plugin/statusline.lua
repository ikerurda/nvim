if not pcall(require, "el") then return end

local builtin = require "el.builtin"
local extensions = require "el.extensions"
local sections = require "el.sections"
local subscribe = require "el.subscribe"
local diagnostics = require "el.diagnostic"
local lsp_statusline = require "el.plugins.lsp_status"

local mode = sections.highlight("StatusLine", extensions.gen_mode {format_string = " %s "})

local git_changes = subscribe.buf_autocmd("el_git_changes", "BufWritePost", function(window, buffer)
	local changes = extensions.git_changes(window, buffer)
	if changes then return " " .. changes:sub(2, -2) end
end)

local git_branch = subscribe.buf_autocmd("el_git_branch", "BufEnter", function(window, buffer)
	local branch = extensions.git_branch(window, buffer)
	if branch then return " " .. branch end
end)

require("el").setup {
	generator = function()
		return {
			mode,
			git_branch,
			git_changes,
			sections.collapse_builtin {"[", builtin.help_list, builtin.readonly_list, "]"},
			sections.split,
			sections.maximum_width(builtin.make_responsive_file(140, 90), 0.40),
			sections.collapse_builtin {", ", builtin.modified_list},
			sections.split,
			lsp_statusline.server_progress,
			diagnostics.make_buffer(),
			sections.collapse_builtin {" [", builtin.line_with_width(3), ":", builtin.column_with_width(2), "]"},
			sections.collapse_builtin {"[", builtin.percentage_through_file, "%%]"}
		}
	end
}
