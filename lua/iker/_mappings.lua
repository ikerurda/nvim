-- Other mappings to remember
-- Insert mode:
--   <C-o> to switch to normal mode for one operation
-- Visual mode:
--   o to go to first line in selection
-- Visual block:
--   <C-a> to increment selected numbers
--   g<C-a> to increment separately selected numbers
-- Command mode:
--   <C-g> and <C-t> to cycle trough the results of a search pattern without confirming
--
vim.g.mapleader = " "
local map = vim.api.nvim_set_keymap
local ops = {noremap = true, silent = true}

map("t", "<esc>", "<C-\\><C-n>", ops)
map("v", "J", ":m '>+1<cr>gv=gv", ops)
map("v", "K", ":m '<-2<cr>gv=gv", ops)

local wk = require("which-key")
wk.setup({plugins = {spelling = {enabled = true, suggestions = 20}}, icons = {separator = "->"}})
wk.register({
	b = {"<cmd>set scrollbind!<cr>", "Bind scrolling"}, -- Must bind both windows
	g = {"<cmd>lua Lazygit()<cr>", "Git"},
	s = {"<cmd>set spell!<cr>", "Toggle spelling"},
	u = {"<cmd>UndotreeToggle<cr>", "Undo Tree"},
	r = {"<cmd>source<cr>", "Reload file"},
	w = {"<cmd>set wrap!<cr>", "Toggle wrap"},
	T = {"<cmd>:cd $HOME<cr>", "change to HOME directory"},
	t = {"<cmd>:cd %:p:h<cr>", "change directory"},
	z = {"<cmd>ZenMode<cr>", "Zen mode"},
	c = {
		name = "code",
		a = {"<cmd>Telescope lsp_code_actions theme=get_cursor<cr>", "Actions"},
		D = {"<cmd>lua vim.lsp.buf.declaration()<cr>", "Declaration"},
		d = {"<cmd>lua vim.lsp.buf.definition()<cr>", "Definition"},
		f = {"<cmd>lua vim.lsp.buf.formatting()<CR>", "Format"},
		i = {"<cmd>lua vim.lsp.buf.implementation()<cr>", "Inplementation"},
		n = {"<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>", "Next diagnostic"},
		p = {"<cmd>lua vim.lsp.diagnostic.goto_next()<cr>", "Previous diagnostic"},
		r = {"<cmd>Telescope lsp_references theme=get_dropdown<cr>", "References"},
		R = {"<cmd>lua vim.lsp.buf.rename()<cr>", "Rename"}
	},
	d = {"<cmd>Telescope dap commands theme=get_cursor<cr>", "Debug"},
	f = {
		name = "find",
		t = {"<cmd>Telescope resume<cr>", "Restore finder"},
		a = {"<cmd>Telescope current_buffer_fuzzy_find<cr>", "Fuzzy in buf."},
		b = {"<cmd>Telescope buffers<cr>", "Buffers"},
		e = {"<cmd>Telescope files<cr>", "File browser"},
		E = {"<cmd>Telescope files cwd=$HOME<cr>", "File browser in root dir."},
		f = {"<cmd>Telescope find_files<cr>", "Files"},
		F = {"<cmd>Telescope find_files cwd=$HOME<cr>", "Files in root dir."},
		g = {"<cmd>Telescope live_grep<cr>", "Live grep"},
		h = {"<cmd>Telescope help_tags<cr>", "Help"},
		j = {
			"<cmd>lua require'telescope'.extensions.project.project(require('telescope.themes').get_dropdown())<CR>",
			"Projects"
		},
		m = {"<cmd>Telescope man_pages<cr>", "Manuals"},
		p = {
			"<cmd>lua require('telescope').extensions.packer.plugins(require('telescope.themes').get_ivy({layout_config={height = .5}}))<cr>",
			"Plugins"
		},
		r = {"<cmd>Telescope oldfiles<cr>", "Recents"}
	},
	p = {
		name = "packer",
		c = {"<cmd>PackerCompile<cr>", "Compile"},
		i = {"<cmd>PackerInstall<cr>", "Install"},
		r = {"<cmd>lua require('utils').reload_lv_config()<cr>", "Reload"},
		s = {"<cmd>PackerSync<cr>", "Sync"},
		u = {"<cmd>PackerUpdate<cr>", "Update"}
	},
	["?"] = "Keybindings"
}, {prefix = "<leader>", silent = true, noremap = true})

wk.register({
	c = {n = {"*``cgn", "Change next"}, N = {"*``cgN", "Change prev"}}, -- change word, esc, and use dot to repeat in next occurrences
	J = {"mzJ`z", "which_key_ignore"},
	H = {"^", "which_key_ignore"},
	L = {"$", "which_key_ignore"},
	K = {"<cmd>lua vim.lsp.buf.hover()<cr>", "Hover info"},
	s = {name = "surround", a = "Arround", s = "Repeat surround", d = "Delete", r = "Replace", t = "Toggle"},
	Y = {"y$", "which_key_ignore"},
	z = "spelling and folds",
	g = {
		name = "go",
		c = "Comment",
		p = {"`[v`]", "Switch to VISUAL using last paste"},
		z = {"yi\":!open https://github.com/<C-R>\"<cr><cr>", "Search github"}
	},
	["<C-e>"] = "Go up a line",
	["<C-y>"] = "Go down a line",
	["<C-u>"] = "Go up half page",
	["<C-d>"] = "Go down half page",
	["<C-b>"] = "Go up a page",
	["<C-f>"] = "Go down a page",
	["<C-q>"] = {"<cmd>lua ToggleQfl()<cr>", "Quickfix"},
	["<C-j>"] = {"<cmd>cnext<cr>", "which_key_ignore"},
	["<C-k>"] = {"<cmd>cprev<cr>", "which_key_ignore"},
	["<C-w>"] = {["<C-w>"] = {"<cmd>WinShift<cr>", "Shift windows"}},
	["<bs>"] = {"<cmd>BufferPrevious<cr>", "Prev. buffer"},
	["<tab>"] = {"<cmd>BufferNext<cr>", "Next buffer"},
	["["] = "previous",
	["]"] = "next",
	["<F1>"] = {"<cmd>WhichKey<cr>", "which_key_ignore"},
	["<F2>"] = "Open Terminal",
	["<F4>"] = {"<cmd>lua require('dap').toggle_breakpoint()<cr>", "Toggle breakpoint"},
	["<F5>"] = {"<cmd>lua StartDebugger()<cr>", "Start debugger"},
	["<F6>"] = {"<cmd>lua EndDebugger()<cr>", "End debugger"},
	["<F10>"] = {"<cmd>lua require('dap').step_into()<cr>", "Step into"},
	["<F11>"] = {"<cmd>lua require('dap').step_out()<cr>", "Step out"},
	["<F12>"] = {"<cmd>lua require('dap').step_over()<cr>", "Step over"}
}, {silent = true})

wk.register({n = {"nzzzv", "which_key_ignore"}, N = {"Nzzzv", "which_key_ignore"}}, {noremap = true})

Lazygit = function()
	require("toggleterm.terminal").Terminal:new({
		cmd = "lazygit",
		dir = vim.fn.expand("%:p:h"),
		direction = "float",
		on_open = function() vim.cmd("startinsert!") end,
		on_close = function() vim.cmd("q") end
	}):toggle()
end

vim.g.ikerurda_qfl = 0
ToggleQfl = function()
	if vim.g.ikerurda_qfl == 0 then
		vim.g.ikerurda_qfl = 1
		vim.cmd "copen"
	else
		vim.g.ikerurda_qfl = 0
		vim.cmd "cclose"
	end
end

StartDebugger = function()
	require("dap").continue()
	require("dapui").open()
end
EndDebugger = function()
	require("dap").disconnect()
	require("dap").close()
	require("dapui").close()
end
