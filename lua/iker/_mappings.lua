-- Other mappings to remember
--- Insert mode:
--    <C-o> to switch to normal mode for one operation
--    <C-w> to remove the last word
--- Visual mode:
--    o to go to first line in selection
--- Visual block:
--    <C-a> to increment selected numbers
--    g<C-a> to increment separately selected numbers
--- Command mode:
--    <C-g> and <C-t> to cycle trough the results of a search pattern without confirming
--
local map = vim.api.nvim_set_keymap
local ops = {noremap = true, silent = true}
vim.g.mapleader = " "
vim.g.maplocalleader = " "

map("v", "J", ":m '>+1<cr>gv=gv", ops)
map("v", "K", ":m '<-2<cr>gv=gv", ops)
map("n", "k", "v:count == 0 ? 'gk' : 'k'", {expr = true, silent = true, noremap = true})
map("n", "j", "v:count == 0 ? 'gj' : 'j'", {expr = true, silent = true, noremap = true})

local wk = require "which-key"
wk.setup({plugins = {spelling = {enabled = true, suggestions = 20}}, icons = {separator = "->"}})
wk.register({
	b = {"<cmd>set scrollbind!<cr>", "Bind scrolling"}, -- Must bind both windows
	d = {"<cmd>Telescope dap commands theme=get_cursor<cr>", "Debug"},
	r = {"<cmd>source<cr>", "Reload file"},
	w = {"<cmd>set wrap!<cr>", "Toggle wrap"},
	c = {
		name = "code",
		a = {"<cmd>Telescope lsp_code_actions theme=get_cursor<cr>", "Actions"},
		c = {"<cmd>let b:copilot_enabled=!b:copilot_enabled<cr>", "Toggle copilot"},
		d = {"<cmd>lua vim.lsp.buf.definition()<cr>", "Definition"},
		D = {"<cmd>lua vim.lsp.buf.declaration()<cr>", "Declaration"},
		f = {"<cmd>lua vim.lsp.buf.formatting()<CR>", "Format"},
		i = {"<cmd>lua vim.lsp.buf.implementation()<cr>", "Inplementation"},
		n = {"<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>", "Next diagnostic"},
		p = {"<cmd>lua vim.lsp.diagnostic.goto_next()<cr>", "Previous diagnostic"},
		r = {"<cmd>Telescope lsp_references theme=get_dropdown<cr>", "References"},
		R = {"<cmd>lua vim.lsp.buf.rename()<cr>", "Rename"}
	},
	g = {
		name = "git",
		a = {"<cmd>G add .<cr>", "Add"},
		c = {"<cmd>G commit<cr>", "Commit"},
		p = {"<cmd>G push<cr>", "Push"},
		s = {"<cmd>G<cr>", "Status"}
	},
	f = {
		name = "find",
		a = {"<cmd>Telescope current_buffer_fuzzy_find<cr>", "Fuzzy in buf."},
		b = {"<cmd>Telescope buffers<cr>", "Buffers"},
		e = {"<cmd>Telescope file_browser<cr>", "File browser"},
		E = {"<cmd>Telescope file_browser cwd=$HOME<cr>", "File browser in root dir."},
		f = {"<cmd>Telescope find_files<cr>", "Files"},
		F = {"<cmd>Telescope find_files cwd=$HOME<cr>", "Files in root dir."},
		g = {"<cmd>Telescope live_grep<cr>", "Live grep"},
		h = {"<cmd>Telescope help_tags<cr>", "Help"},
		j = {"<cmd>Telescope projects theme=dropdown<CR>", "Projects"},
		m = {"<cmd>Telescope man_pages<cr>", "Manuals"},
		p = {"<cmd>Telescope packer<cr>", "Plugins"},
		r = {"<cmd>Telescope oldfiles<cr>", "Recents"},
		s = {"<cmd>Telescope symbols theme=cursor layout_config={width=.6}<cr>", "Symbols"},
		t = {"<cmd>Telescope resume<cr>", "Restore finder"}
	},
	p = {
		name = "packer",
		c = {"<cmd>PackerCompile<cr>", "Compile"},
		i = {"<cmd>PackerInstall<cr>", "Install"},
		s = {"<cmd>PackerSync<cr>", "Sync"},
		u = {"<cmd>PackerUpdate<cr>", "Update"}
	}
}, {prefix = "<leader>", silent = true, noremap = true})

wk.register({
	c = {n = {"*``cgn", "Change next"}, N = {"*``cgN", "Change prev"}}, -- change word, esc, and use dot to repeat in next occurrences
	g = {
		name = "go",
		p = {"`[v`]", "Switch to VISUAL using last paste"},
		z = {"yi\":!open https://github.com/<C-R>\"<cr><cr>", "Search github"}
	},
	H = {"^", "Go to start of line"},
	J = {"mzJ`z", "Join lines"},
	K = {"<cmd>lua vim.lsp.buf.hover()<cr>", "Hover info"},
	L = {"$", "Go to end of line"},
	n = {"nzzzv", "Jump to next occurrence"},
	N = {"nzzzv", "Jump to prev occurrence"},
	s = {name = "surround", a = "Arround", s = "Repeat surround", d = "Delete", r = "Replace", t = "Toggle"},
	Y = {"y$", "Yank to end of line"},
	z = "spelling and folds",
	["["] = "previous ...",
	["]"] = "next ...",
	["<C-b>"] = "Go up a page",
	["<C-d>"] = "Go down half page",
	["<C-e>"] = "Go up a line",
	["<C-f>"] = "Go down a page",
	["<C-l>"] = "which_key_ignore",
	["<C-n>"] = {"<cmd>cnext<cr>", "Next in quickfixlist"},
	["<C-p>"] = {"<cmd>cprev<cr>", "Prev in quickfixlist"},
	["<C-q>"] = {"<cmd>copen<cr>", "Open quickfixlist"},
	["<C-u>"] = "Go up half page",
	["<C-w>"] = {["<C-w>"] = {"<cmd>WinShift<cr>", "Shift windows"}},
	["<C-y>"] = "Go down a line",
	["<tab>"] = {"<cmd>BufferNext<cr>", "Next buffer"},
	["<bs>"] = {"<cmd>BufferPrevious<cr>", "Prev. buffer"},
	["<F1>"] = {"<cmd>WhichKey<cr>", "which_key_ignore"},
	["<F2>"] = {"<cmd>new | wincmd J | call nvim_win_set_height(0,12) | set winfixheight | term<cr>", "New terminal"},
	["<F4>"] = {"<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Toggle breakpoint"},
	["<F5>"] = {"<cmd>lua require'dap'.continue()<cr>", "Start debugger"},
	["<F6>"] = {"<cmd>lua require'dap'.disconnect()<cr>", "End debugger"},
	["<F10>"] = {"<cmd>lua require'dap'.step_over()<cr>", "Step over"},
	["<F11>"] = {"<cmd>lua require'dap'.step_into()<cr>", "Step into"},
	["<F12>"] = {"<cmd>lua require'dap'.step_out()<cr>", "Step out"}
}, {silent = true, noremap = true})

vim.cmd [[
augroup autoFmt
    au!
    au BufWritePre * lua vim.lsp.buf.formatting_sync(nil, 1000)
augroup END ]]

vim.cmd [[
augroup hlYanked
    au!
    au TextYankPost * silent! lua vim.highlight.on_yank {higroup='IncSearch', timeout=200}
augroup END ]]

vim.cmd [[
augroup term
    au!
    au TermOpen * startinsert | setlocal signcolumn=no norelativenumber nonumber
    au TermOpen * silent tnoremap <esc> <C-\><C-n>
augroup END ]]

vim.cmd "command! W noa w"
vim.cmd "command! Wq noa wq"
vim.cmd "command! Wqa noa wqa"
