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
map("n", "<c-t>", function()
  local folder = vim.fn.expand "%:h"
  local out = vim.fn.system("git -C " .. folder .. " rev-parse --show-toplevel")
  vim.cmd("cd " .. (vim.v.shell_error == 0 and out or folder))
end) -- cd to git root or current file
map("n", "<c-q>", function()
  for _, win in pairs(vim.fn.getwininfo()) do
    if win["quickfix"] == 1 then
      vim.cmd "cclose"
      return
    end
  end
  vim.cmd "copen"
end) -- Toggle qflist
map("n", "<c-n>", "<cmd>cnext<cr>zz") -- Jump to next qflist item
map("n", "<c-p>", "<cmd>cprev<cr>zz") -- Jump to prev qflist item
map("n", "<tab>", "<cmd>bn<cr>")
map("n", "<bs>", "<cmd>bp<cr>")
map("n", "<s-tab>", "<cmd>Telescope buffers<cr>")
map("n", "<leader>g", function()
  require("neogit").open { cwd = vim.fn.expand "%:h" }
end) -- Open neogit

-- Toggles
map("n", "<leader>tw", "<cmd>set wrap!<cr>")
map("n", "<leader>ts", "<cmd>set spell!<cr>")
map("n", "<leader>tb", "<cmd>set scrollbind!<cr>")
map("n", "<leader>tr", "<cmd>set relativenumber!<cr>")
map("n", "<leader>tc", "<cmd>ColorizerToggle<cr>")

-- Packer
map("n", "<leader>ps", "<cmd>PackerSync<cr>")
map("n", "<leader>pu", "<cmd>PackerUpdate<cr>")
map("n", "<leader>pi", "<cmd>PackerInstall<cr>")
map("n", "<leader>pc", "<cmd>PackerClean<cr>")
map("n", "<leader>pp", "<cmd>PackerCompile<cr>")

-- LSPinstaller
map("n", "<leader>ll", "<cmd>LspInfo<cr>")
map("n", "<leader>li", "<cmd>LspInstallInfo<cr>")
map("n", "<leader>ls", "<cmd>LspStop<cr>")

-- Telescope
map("n", "<leader>fb", "<cmd>Telescope buffers<cr>")
map("n", "<leader>ft", "<cmd>Telescope resume<cr>")
map("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>")
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>")
map("n", "<leader>fs", "<cmd>Telescope grep_string<cr>")
map("n", "<leader>fa", "<cmd>Telescope current_buffer_fuzzy_find<cr>")
map("n", "<leader>fv", "<cmd>Telescope symbols<cr>")
map("n", "<leader>fj", "<cmd>Telescope project<cr>")
map("n", "<leader>fp", "<cmd>Telescope packer<cr>")
map("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")
map("n", "<leader>fm", "<cmd>Telescope man_pages<cr>")
map("n", "<leader>fe", "<cmd>Telescope file_browser<cr>")

--[[
Other important mappings to remember:
* Insert mode:
    <c-o> to switch to normal mode for one operation
    <c-w> to remove the last word
    <a-e> to to fastwrap (nvim-autopairs)
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
