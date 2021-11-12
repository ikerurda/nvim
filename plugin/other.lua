if not pcall(require, "mkdir") then return end

require"Comment".setup {}
require"surround".setup {mappings_style = "sandwich"}
require"gitsigns".setup {keymaps = {}}
require"colorizer".setup({}, {mode = "foreground"})
require"indent_blankline".setup {
	filetype_exclude = {"help", "man", "packer"},
	buftype_exclude = {"terminal"},
	bufname_exclude = {"Untitled"},
	show_trailing_blankline_indent = false,
	show_end_of_line = true,
	use_treesitter = true
}
