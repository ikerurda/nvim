local map = vim.keymap.set

-- General
map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true })
map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true })
map("v", "J", ":m '>+1<cr>gv=gv") -- Move line down
map("v", "K", ":m '<-2<cr>gv=gv") -- Move line up
map("n", "H", "^") -- Go to start of line
map("n", "L", "$") -- Go to end of line
map("n", "J", "mzJ`z") -- Join lines and return to position
map("n", "n", "nzzzv") -- Jump to next occurrence and center cursor
map("n", "N", "Nzzzv") -- Jump to prev occurrence and center cursor
map("n", "cn", "*``cgn") -- Change word, <ESC>, repeat forwards with <.>
map("n", "cN", "*``cgN") -- Change word, <ESC>, repeat backwards with <.>
local cmd = "fugitive#head() != '' ? '<cmd>Gcd<CR>' : '<cmd>cd %:h<cr>'"
map("n", "<c-t>", cmd, { expr = true }) -- cd to git root or current file
map("n", "<c-n>", "<cmd>cnext<cr>zz") -- Jump to next qflist item
map("n", "<c-p>", "<cmd>cprev<cr>zz") -- Jump to prev qflist item

-- Toggles
map("n", "<leader>tw", "<cmd>set wrap!<cr>")
map("n", "<leader>ts", "<cmd>set spell!<cr>")
map("n", "<leader>tb", "<cmd>set scrollbind!<cr>")
map("n", "<leader>tr", "<cmd>set relativenumber!<cr>")
map("n", "<leader>tc", "<cmd>ColorizerToggle<cr>")

-- Buffer
map("n", "<tab>", "<cmd>BufferLineCycleNext<cr>")
map("n", "<bs>", "<cmd>BufferLineCyclePrev<cr>")
map("n", "<leader>bb", "<cmd>BufferLinePick<cr>")
map("n", "<leader>bc", "<cmd>BufferLinePickClose<cr>")
map("n", "<leader>bh", "<cmd>BufferLineMovePrev<cr>")
map("n", "<leader>bl", "<cmd>BufferLineMoveNext<cr>")

-- Packer
local packer = require "packer"
map("n", "<leader>ps", packer.sync)
map("n", "<leader>pu", packer.update)
map("n", "<leader>pi", packer.install)
map("n", "<leader>pl", packer.clean)
map("n", "<leader>pc", packer.compile)

-- LSPinstaller
map("n", "<leader>ll", "<cmd>LspInfo<cr>")
map("n", "<leader>li", "<cmd>LspInstallInfo<cr>")
map("n", "<leader>ls", "<cmd>LspStop<cr>")

-- Telescope
local tl = require "telescope.builtin"
local ext = require("telescope").extensions
map("n", "<leader>ft", tl.resume)
map("n", "<leader>fr", tl.oldfiles)
map("n", "<leader>fb", tl.buffers)
map("n", "<leader>ff", tl.find_files)
map("n", "<leader>fg", tl.live_grep)
map("n", "<leader>fs", tl.grep_string)
map("n", "<leader>fa", tl.current_buffer_fuzzy_find)
map("n", "<leader>fh", tl.help_tags)
map("n", "<leader>fm", tl.man_pages)
map("n", "<leader>fe", ext.file_browser.file_browser)
map("n", "<leader>fp", ext.packer.packer)

-- Hop
map("n", "f", "<cmd>HopChar1CurrentLine<cr>")
map("n", "<leader>hc", "<cmd>HopChar2<cr>")
map("n", "<leader>hw", "<cmd>HopWord<cr>")
map("n", "<leader>hl", "<cmd>HopLineStart<cr>")
map("n", "<leader>hp", "<cmd>HopPattern<cr>")

-- Git
map("n", "<leader>gg", "<cmd>G<cr>")
map("n", "<leader>ga", "<cmd>G add .<cr>")
map("n", "<leader>gd", "<cmd>G diff<cr>")
map("n", "<leader>gc", "<cmd>G commit<cr>")
map("n", "<leader>gp", "<cmd>G push<cr>")

--[[
Other important mappings to remember:
* Insert mode:
    <c-o> to switch to normal mode for one operation
    <c-w> to remove the last word
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
