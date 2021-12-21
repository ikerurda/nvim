-- Mapping functions
local function map(mode, key, command, opt)
	local opts = opt or {noremap = true, silent = true}
	vim.api.nvim_set_keymap(mode, key, command, opts)
end

local function nmap(...) map("n", ...) end
local function nmapl(m,...) map("n", "<leader>"..m, ...) end


-- General
local opts = {expr = true, silent = true, noremap = true}
vim.api.nvim_set_keymap("n", "k", "v:count == 0 ? 'gk' : 'k'", opts)
vim.api.nvim_set_keymap("n", "j", "v:count == 0 ? 'gj' : 'j'", opts)
map("v", "J", ":m '>+1<cr>gv=gv") -- Move line down
map("v", "K", ":m '<-2<cr>gv=gv") -- Move line up

nmap("H", "^") -- Go to start of line
nmap("L", "$") -- Go to end of line
nmap("Y", "y$") -- Yank to end of line
nmap("J", "mzJ`z") -- Join lines
nmap("n", "nzzzv") -- Jump to next occurrence
nmap("N", "nzzzv") -- Jump to prev occurrence
nmap("gP", "`[v`]") -- Switch to VISUAL using last paste
nmap("cn", "*``cgn") -- Change word, <ESC>, repeat forwards with <.>
nmap("cN", "*``cgN") -- Change word, <ESC>, repeat backwards with <.>

nmap("<c-n>", "<cmd>cnext<cr>zz") -- Next in qflist
nmap("<c-p>", "<cmd>cprev<cr>zz") -- Prev in qflist
nmap("<c-t>", "<cmd>cd %:h<cr>") -- cd to current file

nmap("<tab>", "<cmd>bn<cr>") -- Next buffer
nmap("<bs>", "<cmd>bp<cr>") -- Prev buffer
nmap("<leader>b", "<cmd>BufferLinePick<cr>") -- Pick buffer


-- Toggles
nmap("<leader>tw", "<cmd>set wrap!<cr>") -- Toggle wrap
nmap("<leader>ts", "<cmd>set spell!<cr>") -- Toggle spelling
nmap("<leader>tb", "<cmd>set scrollbind!<cr>") -- Toggle scrollbind
nmap("<leader>tc", "<cmd>ColorizerToggle<cr>") -- Toggle colorizer
nmap("<leader>tr", "<cmd>set relativenumber!<cr>") -- Toggle colorizer
nmap("<c-q>", "<cmd>lua Toggle_qfl()<cr>") -- Toggle qflist

Toggle_qfl = function()
	for _, win in pairs(vim.fn.getwininfo()) do
		if win["quickfix"] == 1 then
			vim.cmd "cclose"
			return
		end
	end
	vim.cmd "copen"
end


-- Telescope
nmapl("ft", "<cmd>Telescope resume<cr>") -- Restore finder
nmapl("fr", "<cmd>Telescope oldfiles<cr>") -- Recents
nmapl("fj", "<cmd>Telescope projects theme=dropdown<cr>") -- Projects
nmapl("fe", "<cmd>lua require 'telescope'.extensions.file_browser.file_browser()<cr>") -- File broser
nmapl("fE", "<cmd>lua require 'telescope'.extensions.file_browser.file_browser({cwd='$HOME'})<cr>") -- File broser at $HOME
nmapl("ff", "<cmd>Telescope find_files<cr>") -- Find files
nmapl("fF", "<cmd>Telescope find_files cwd=$HOME<cr>") -- Find files in $HOME
nmapl("fg", "<cmd>Telescope live_grep<cr>") -- Live grep directory
nmapl("fa", "<cmd>Telescope current_buffer_fuzzy_find<cr>") -- Search in buffer
nmapl("fs", "<cmd>Telescope grep_string<cr>") -- Grep string
nmapl("fp", "<cmd>Telescope packer<cr>") -- Plugins
nmapl("fb", "<cmd>Telescope buffers<cr>") -- Buffers
nmapl("fh", "<cmd>Telescope help_tags<cr>") -- Help


-- Hop
nmap("f", "<cmd>HopChar1CurrentLine<cr>") -- Hop to char in current line
nmapl("hc", "<cmd>HopChar2<cr>") -- Hop to occurrence of a bigram
nmapl("hw", "<cmd>HopWord<cr>") -- Hop to word
nmapl("hl", "<cmd>HopLineStart<cr>") -- Hop to start of a line
nmapl("hp", "<cmd>HopPattern<cr>") -- Hop matching against a pattern


-- Packer
nmapl("ps", "<cmd>PackerSync<cr>") -- Sync
nmapl("pu", "<cmd>PackerUpdate<cr>") -- Update
nmapl("pi", "<cmd>PackerInstall<cr>") -- Install
nmapl("pl", "<cmd>PackerClean<cr>") -- Clean
nmapl("pc", "<cmd>PackerCompile<cr>") -- Compile


-- LSPinstaller
nmapl("ll", "<cmd>LspInfo<cr>") -- Lsp info
nmapl("li", "<cmd>LspInstallInfo<cr>") -- Lsp installation info
nmapl("ls", "<cmd>LspStop<cr>") -- Stop inactive language servers


-- Git
nmapl("gg", "<cmd>G<cr>") -- Status
nmapl("ga", "<cmd>G add .<cr>") -- Add / Stage (s)
nmapl("gd", "<cmd>G diff<cr>") -- Diff (dv or =)
nmapl("gc", "<cmd>G commit<cr>") -- Commit (cc), (Amend: ce)
nmapl("gp", "<cmd>G push<cr>") -- Push

--[[
Other important mappings to remember:
* Insert mode:
    <c-o> to switch to normal mode for one operation
    <c-w> to remove the last word
	<c-k> to insert digraphs (see :dig)
* Normal mode:
	<gx> to open url below cursor
	<c-]> Jump to the definition of the keyword (useful in help pages)
* Visual mode:
    <o> to go to start line of selection
    <c-e> and <c-y> to scroll up or down 1 line
    <c-u> and <c-d> to scroll up or down half a page
    <c-b> and <c-f> to scroll up or down a page
* Visual block:
    <c-a> to bulk increment selected numbers
    g<c-a> to increment separately selected numbers
* Command mode:
    <c-g> and <c-t> cycle the results of a search pattern without confirming
--]]
