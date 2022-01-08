-- Mapping functions
local function map(mode, key, command, opt)
  local default = { noremap = true, silent = true }
  local opts = vim.tbl_deep_extend("force", default, opt or {})
  vim.api.nvim_set_keymap(mode, key, command, opts)
end

local function nmap(...)
  map("n", ...)
end
local function lmap(m, ...)
  nmap("<leader>" .. m, ...)
end

-- General
map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true })
map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true })
map("v", "J", ":m '>+1<cr>gv=gv") -- Move line down
map("v", "K", ":m '<-2<cr>gv=gv") -- Move line up
nmap("H", "^") -- Go to start of line
nmap("L", "$") -- Go to end of line
nmap("Y", "y$") -- Yank to end of line
nmap("J", "mzJ`z") -- Join lines and return to position
nmap("n", "nzzzv") -- Jump to next occurrence and center cursor
nmap("N", "Nzzzv") -- Jump to prev occurrence and center cursor
nmap("gP", "`[v`]") -- Switch to VISUAL using last paste
lmap("p", "\"0p") -- Paste last copied text
nmap("cn", "*``cgn") -- Change word, <ESC>, repeat forwards with <.>
nmap("cN", "*``cgN") -- Change word, <ESC>, repeat backwards with <.>
local cmd = "fugitive#head() != '' ? '<cmd>Gcd<CR>' : '<cmd>cd %:h<cr>'"
nmap("<c-t>", cmd, { expr = true }) -- cd to git root or current file

-- Buffer
nmap("<tab>", "<cmd>BufferLineCycleNext<cr>") -- Next buffer
nmap("<bs>", "<cmd>BufferLineCyclePrev<cr>") -- Prev buffer
lmap("bb", "<cmd>BufferLinePick<cr>") -- Pick buffer
lmap("bc", "<cmd>BufferLinePickClose<cr>") -- Pick buffer to close
lmap("bh", "<cmd>BufferLineMovePrev<cr>") -- Move buffer to the left
lmap("bl", "<cmd>BufferLineMoveNext<cr>") -- Move buffer to the right

-- Toggles
lmap("tw", "<cmd>set wrap!<cr>") -- Toggle wrap
lmap("ts", "<cmd>set spell!<cr>") -- Toggle spelling
lmap("tb", "<cmd>set scrollbind!<cr>") -- Toggle scrollbind
lmap("tc", "<cmd>ColorizerToggle<cr>") -- Toggle colorizer
lmap("tr", "<cmd>set relativenumber!<cr>") -- Toggle colorizer

-- QFlist
nmap("<c-n>", "<cmd>cnext<cr>zz") -- Next in qflist
nmap("<c-p>", "<cmd>cprev<cr>zz") -- Prev in qflist
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
lmap("ft", "<cmd>Telescope resume<cr>") -- Restore finder
lmap("fr", "<cmd>Telescope oldfiles<cr>") -- Recents
lmap("fR", "<cmd>Telescope oldfiles only_cwd=true<cr>") -- Recents
lmap("fj", "<cmd>Telescope project<cr>") -- Projects
lmap(
  "fe",
  "<cmd>lua require 'telescope'.extensions.file_browser.file_browser()<cr>"
) -- File broser
lmap("ff", "<cmd>Telescope find_files<cr>") -- Find files
lmap("fg", "<cmd>Telescope live_grep<cr>") -- Live grep directory
lmap("fa", "<cmd>Telescope current_buffer_fuzzy_find<cr>") -- Search in buffer
lmap("fs", "<cmd>Telescope grep_string<cr>") -- Grep string
lmap("fp", "<cmd>Telescope packer<cr>") -- Plugins
lmap("fb", "<cmd>Telescope buffers<cr>") -- Buffers
lmap("fh", "<cmd>Telescope help_tags<cr>") -- Help
lmap("fm", "<cmd>Telescope man_pages<cr>") -- Help

-- Hop
nmap("f", "<cmd>HopChar1CurrentLine<cr>") -- Hop to char in current line
lmap("hc", "<cmd>HopChar2<cr>") -- Hop to occurrence of a bigram
lmap("hw", "<cmd>HopWord<cr>") -- Hop to word
lmap("hl", "<cmd>HopLineStart<cr>") -- Hop to start of a line
lmap("hp", "<cmd>HopPattern<cr>") -- Hop matching against a pattern

-- Packer
lmap("ps", "<cmd>PackerSync<cr>") -- Sync
lmap("pu", "<cmd>PackerUpdate<cr>") -- Update
lmap("pi", "<cmd>PackerInstall<cr>") -- Install
lmap("pl", "<cmd>PackerClean<cr>") -- Clean
lmap("pc", "<cmd>PackerCompile<cr>") -- Compile

-- LSPinstaller
lmap("ll", "<cmd>LspInfo<cr>") -- Lsp info
lmap("li", "<cmd>LspInstallInfo<cr>") -- Lsp installation info
lmap("ls", "<cmd>LspStop<cr>") -- Stop inactive language servers

-- Git
lmap("gg", "<cmd>G<cr>") -- Status
lmap("ga", "<cmd>G add .<cr>") -- Add / Stage (s)
lmap("gd", "<cmd>G diff<cr>") -- Diff (dv or =)
lmap("gc", "<cmd>G commit<cr>") -- Commit (cc), (Amend: ce or ca)
lmap("gp", "<cmd>G push<cr>") -- Push

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
