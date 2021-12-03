local o = vim.opt

o.pumblend = 17
o.wildoptions = "pum"
o.completeopt = "menuone,preview,noselect"

o.title = true -- Show the file name as window title
o.confirm = true -- Confirm instead of error when file now saved
o.showmode = false -- Hide vim mode
o.showcmd = true -- Show number of chars / lines in visual mode
o.cmdheight = 1 -- Height of the command bar
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
o.updatetime = 1000 -- Make updates happen faster
o.scrolloff = 5 -- Make it so there are always five lines below my cursor
o.undofile = true -- Automatically save undo history to undo file
o.timeoutlen = 1000 -- Milliseconds to wait for a mapped sequence to complete
o.foldmethod = "marker" -- Use {{{ and }}} as fold marks
o.list = true -- Fixes cursor at end of tab chars
o.listchars = {tab = "  ", trail = "·"}

o.autoindent = true -- Copy indent of prev line in new lines
o.cindent = true -- Use c indenting

o.tabstop = 4
o.shiftwidth = 4
o.softtabstop = 4

o.wrap = false
o.breakindent = true -- wrapped lines will maitain indentation
o.linebreak = true -- wrap lines at a character in 'breakat' rather the las char

o.clipboard = "unnamedplus"
o.guicursor = "n-v-c-sm:block,i-ci-ve:hor25,r-cr-o:hor25"
o.mouse = "a" -- Mouse in all modes
o.belloff = "all" -- Just turn the dang bell off
o.termguicolors = true -- Enables more colors

o.shortmess = o.shortmess
+ "a" -- abbreviations: all
+ "s" -- don't give "search hit BOTTOM, continuing at TOP" or similar messages
+ "c" -- don't give "match 1 of 2" or similiar messages
