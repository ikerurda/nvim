local o = vim.opt
local g = vim.g

g.mapleader = " " -- leader mapping
g.did_load_filetypes = 0 -- tmp
g.do_filetype_lua = 1 -- tmp

o.wildoptions = "pum"
o.completeopt = "menuone,preview,noselect"

o.title = true -- Show the file name as window title
o.confirm = true -- Confirm instead of error when file now saved
o.showmode = false -- Hide vim mode
o.showcmd = true -- Show number of chars / lines in visual mode
o.showtabline = 0 -- Hide tabline
o.cmdheight = 1 -- Height of the command bar
o.winbar = "%t%M" -- Winbar info (filename, modified)
o.incsearch = true -- Makes search act like search in modern browsers
o.inccommand = "split" -- Shows partial off screen results
o.hlsearch = false -- Prevent search results highlight
o.showmatch = true -- show matching brackets when text indicator is over them
o.relativenumber = true -- Show line numbers
o.number = true -- But show the actual number for the line we're on
o.signcolumn = "yes" -- Show sign column
o.ignorecase = true -- Ignore case when searching...
o.smartcase = true -- ... unless there is a capital letter in the query
o.cursorline = true -- Highlight the current line
o.equalalways = false -- I don't like my windows changing all the time
o.splitright = true -- Prefer windows splitting to the right
o.splitbelow = true -- Prefer windows splitting in the bottom
o.updatetime = 1000 -- Make updates happen faster
o.scrolloff = 5 -- Make it so there are always min 5 lines around cursor
o.sidescrolloff = 5 -- Make it so there are always min 5 chars around cursor
o.undofile = true -- Automatically save undo history to undo file
o.timeoutlen = 1000 -- Milliseconds to wait for a mapped sequence to complete
o.foldmethod = "marker" -- Use {{{ and }}} as fold marks
o.colorcolumn = "80"
o.list = true
o.listchars = { tab = "  ", trail = "·" }

o.autoindent = true -- Copy indent of prev line in new lines
-- o.expandtab = true
-- o.tabstop = 2
-- o.shiftwidth = 2
-- o.softtabstop = 2
-- o.fileformat = "unix"

o.wrap = false
o.breakindent = true -- wrapped lines will maitain indentation
o.linebreak = true

o.clipboard = "unnamedplus"
o.mouse = "a" -- Mouse in all modes
o.belloff = "all" -- Just turn the dang bell off
o.termguicolors = true -- Enables more colors

o.shortmess = o.shortmess
		+ "a" -- abbreviations: all
		+ "s" -- don't give "search hit BOTTOM, continuing at TOP" or similar messages
		+ "c" -- don't give "match 1 of 2" or similiar messages
