--
--  ░▀█▀░▒█▄░▒█░▀█▀░▀▀█▀▀░░░░▒█░░▒█░▀█▀░▒█▀▄▀█
--  ░▒█░░▒█▒█▒█░▒█░░░▒█░░░▄▄░░▒█▒█░░▒█░░▒█▒█▒█
--  ░▄█▄░▒█░░▀█░▄█▄░░▒█░░░▀▀░░░▀▄▀░░▄█▄░▒█░░▒█
--
--  Config file for NVIM. Created by Iker Urdaniz.
--
require "iker._plugins"
-- Auto format when saving
vim.cmd "au BufWritePre * lua vim.lsp.buf.formatting_sync(nil, 1000)"
vim.cmd "command! Format :lua vim.lsp.buf.formatting_seq_sync(nil, 1000)"
-- Prevent formatting when saving
vim.cmd "command! W noa w"
vim.cmd "command! Wq noa w | q"
-- Highlight yanked area
vim.cmd "au TextYankPost * silent! lua vim.highlight.on_yank {higroup='IncSearch', timeout=200}"

vim.o.title = true
vim.opt.shortmess:append("asIc")
vim.o.confirm = true
vim.o.showmode = false
vim.o.splitright = true
vim.o.termguicolors = true

vim.o.clipboard = "unnamed"
vim.o.mouse = "a"
vim.o.autowrite = true
vim.o.undofile = true
vim.o.hidden = true
vim.o.timeoutlen = 200

vim.wo.number = true
vim.wo.relativenumber = true
vim.o.cursorline = true
vim.o.wrap = false
vim.o.scrolloff = 3
vim.o.linebreak = true
vim.o.breakindent = true
vim.o.signcolumn = "yes"

vim.o.smartindent = true
vim.o.expandtab = false
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.listchars = "tab:┊ ,trail:·,eol:¬"

vim.o.inccommand = "split"
vim.o.hlsearch = false
vim.o.smartcase = true
vim.o.ignorecase = true
vim.o.spelllang = "en"
vim.o.list = true
vim.o.completeopt = "menuone,noselect"
