vim.g.bufferline = {auto_hide = true, animation = false, icons = false}

require"github-theme".setup {
	theme_style = "dark_default",
	sidebars = {"qf", "which_key", "toggleterm"},
	hide_inactive_statusline = false
}

vim.cmd "highlight BufferCurrentSign guifg=#58a6ff gui=bold"
vim.cmd "highlight BufferVisible guifg=#58a6ff gui=nocombine"
vim.cmd "highlight BufferVisibleSign guifg=#58a6ff gui=nocombine"
vim.cmd "highlight BufferVisibleMod guifg=#58a6ff gui=nocombine"

vim.cmd "highlight CmpItemAbbrMatch guifg=#58a6ff gui=nocombine"
vim.cmd "highlight CmpItemAbbrMatchFuzzy guifg=#58a6ff gui=nocombine"

vim.cmd "highlight TelescopeTitle guibg=#58a6ff guifg=#ffffff"

vim.cmd "highlight NonText guifg=#8b949e"

require"lualine".setup {
	options = {
		icons_enabled = false,
		theme = "github",
		component_separators = {"", ""},
		section_separators = {"", ""},
		disabled_filetypes = {"NvimTree"}
	},
	sections = {
		lualine_a = {"mode"},
		lualine_b = {"branch", "diff"},
		lualine_c = {{"filename", path = 1}},
		lualine_x = {{"diagnostics", sources = {"nvim_lsp"}}},
		lualine_y = {"progress"},
		lualine_z = {"location"}
	}
}

vim.opt.list = true
vim.opt.listchars:append("tab:┊ ,trail:·,eol:¬")
