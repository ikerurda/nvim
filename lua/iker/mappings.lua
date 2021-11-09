local function map(m, k, c) vim.api.nvim_set_keymap(m, k, c, {noremap = true, silent = true}) end

-- {{{ General
vim.api.nvim_set_keymap("n", "k", "v:count == 0 ? 'gk' : 'k'", {expr = true, silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "j", "v:count == 0 ? 'gj' : 'j'", {expr = true, silent = true, noremap = true})
map("v", "J", ":m '>+1<cr>gv=gv") -- Move line down
map("v", "K", ":m '<-2<cr>gv=gv") -- Move line up

map("n", "<leader>r", "<cmd>source %<cr>") -- Source file
map("n", "H", "^") -- Go to start of line
map("n", "L", "$") -- Go to end of line
map("n", "Y", "y$") -- Yank to end of line
map("n", "J", "mzJ`z") -- Join lines
map("n", "n", "nzzzv") -- Jump to next occurrence
map("n", "N", "nzzzv") -- Jump to prev occurrence
map("n", "gp", "`[v`]") -- Switch to VISUAL using last paste
map("n", "cn", "*``cgn") -- Change current word then <ESC> and allow repeat in next occurrences with <.>
map("n", "cN", "*``cgN") -- Change current word then <ESC> and allow repeat in prev occurrences with <.>

map("n", "<c-n>", "<cmd>cnext<cr>zz") -- Next in qflist
map("n", "<c-p>", "<cmd>cprev<cr>zz") -- Prev in qflist
map("n", "<tab>", "<cmd>bn<cr>") -- Next buffer
map("n", "<bs>", "<cmd>bp<cr>") -- Prev buffer

map("n", "<F2>", "<cmd>new | wincmd J | call nvim_win_set_height(0,12) | set winfixheight | term<cr>") -- Open small terminal
-- }}}
-- {{{ Toggles
map("n", "<leader>tw", "<cmd>set wrap!<cr>") -- Toggle wrap
map("n", "<leader>ts", "<cmd>set spell!<cr>") -- Toggle spelling
map("n", "<leader>tb", "<cmd>set scrollbind!<cr>") -- Toggle scrollbind
map("n", "<c-q>", "<cmd>lua Toggle_qfl()<cr>") -- Toggle qflist

Toggle_qfl = function()
	for _, win in pairs(vim.fn.getwininfo()) do
		if win["quickfix"] == 1 then
			vim.cmd "cclose"
			return
		end
	end
	vim.cmd "copen"
end
-- }}}
-- {{{ LSP
map("n", "<leader>ca", "<cmd>Telescope lsp_code_actions theme=get_cursor<cr>") -- Actions
map("n", "<leader>cr", "<cmd>lua vim.lsp.buf.rename()<cr>") -- Rename
map("n", "<leader>cd", "<cmd>lua vim.lsp.buf.definition()<cr>") -- Definition
map("n", "<leader>cD", "<cmd>lua vim.lsp.buf.declaration()<cr>") -- Declaration
map("n", "<leader>ci", "<cmd>lua vim.lsp.buf.implementation()<cr>") -- Implementation
map("n", "<leader>cR", "<cmd>Telescope lsp_references theme=get_dropdown<cr>") -- References
map("n", "<leader>cp", "<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>") -- Go to next diagnostic
map("n", "<leader>cn", "<cmd>lua vim.lsp.diagnostic.goto_next()<cr>") -- Go to prev diagnostic
map("n", "<leader>cf", "<cmd>lua vim.lsp.buf.formatting()<cr>") -- Format
map("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>") -- Hover info
-- }}}
-- {{{ Debugger
map("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>") -- Toggle breakpoint
map("n", "<leader>dr", "<cmd>lua require'dap'.repl.open()<cr>") -- Open repl
map("n", "<leader>dk", "<cmd>lua require'dap.ui.variables'.hover()<cr>") -- Hove variables

map("n", "<F8>", "<cmd>lua require'dap'.continue()<cr>") -- Start debugger
map("n", "<F9>", "<cmd>lua require'dap'.disconnect()<cr>") -- End debugger
map("n", "<F10>", "<cmd>lua require'dap'.step_over()<cr>") -- Step over
map("n", "<F11>", "<cmd>lua require'dap'.step_into()<cr>") -- Step into
map("n", "<F12>", "<cmd>lua require'dap'.step_out()<cr>") -- Step out
-- }}}
-- {{{ Telescope
map("n", "<leader>ft", "<cmd>Telescope resume<cr>") -- Restore finder
map("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>") -- Recents
map("n", "<leader>fj", "<cmd>Telescope projects theme=dropdown<cr>") -- Projects
map("n", "<leader>fe", "<cmd>Telescope file_browser<cr>") -- File broser
map("n", "<leader>fE", "<cmd>Telescope file_browser cwd=$HOME<cr>") -- File broser at $HOME
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- Find files
map("n", "<leader>fF", "<cmd>Telescope find_files<cr>") -- Find files in $HOME
map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>") -- Live grep
map("n", "<leader>fa", "<cmd>Telescope current_buffer_fuzzy_find<cr>") -- Search in current buffer
map("n", "<leader>fs", "<cmd>Telescope symbols theme=cursor layout_config={width=.6}<cr>") -- Symbols
map("n", "<leader>fp", "<cmd>Telescope packer<cr>") -- Plugins
map("n", "<leader>fb", "<cmd>Telescope buffers<cr>") -- Buffers
map("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- Help
map("n", "<leader>fm", "<cmd>Telescope man_pages<cr>") -- Manual
-- }}}
-- {{{ Packer
map("n", "<leader>ps", "<cmd>PackerSync<cr>") -- Sync
map("n", "<leader>pu", "<cmd>PackerUpdate<cr>") -- Update
map("n", "<leader>pi", "<cmd>PackerInstall<cr>") -- Install
map("n", "<leader>pl", "<cmd>PackerClean<cr>") -- Clean
map("n", "<leader>pc", "<cmd>PackerCompile<cr>") -- Compile
-- }}}
-- {{{ Git
map("n", "<leader>gg", "<cmd>G<cr>") -- Status
map("n", "<leader>ga", "<cmd>G add .<cr>") -- Add / Stage (s)
map("n", "<leader>gd", "<cmd>G diff<cr>") -- Diff (dv or =)
map("n", "<leader>gc", "<cmd>G commit<cr>") -- Commit (cc), (amend: ce)
map("n", "<leader>gp", "<cmd>G push<cr>") -- Push
-- }}}

--[[
Other important mappings to remember:
* Insert mode:
    <c-o> to switch to normal mode for one operation
    <c-w> to remove the last word
* Visual mode:
    <o> to go to start line of selection
    <c-e> and <c-y> to scroll up or down 1 line
    <c-u> and <c-d> to scroll up or down half a page
    <c-b> and <c-f> to scroll up or down a page
* Visual block:
    <c-a> to bulk increment selected numbers
    g<c-a> to increment separately selected numbers
* Command mode:
    <c-g> and <c-t> to cycle trough the results of a search pattern without confirming
--]]
