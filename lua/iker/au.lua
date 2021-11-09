vim.cmd [[
augroup hlYanked
    au!
    au TextYankPost * silent! lua vim.highlight.on_yank {higroup="IncSearch", timeout=200}
augroup END ]]

vim.cmd [[
augroup term
    au!
    au TermOpen * startinsert | setlocal signcolumn=no norelativenumber nonumber
    au TermOpen * silent tnoremap <esc> <C-\><C-n>
augroup END ]]

vim.cmd [[
augroup autoFmt
    au!
    au BufWritePre * lua vim.lsp.buf.formatting_sync(nil, 1000)
augroup END ]]

vim.cmd "command! W noa w"
vim.cmd "command! Wq noa wq"
vim.cmd "command! Wqa noa wqa"
