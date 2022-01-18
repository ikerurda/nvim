vim.cmd [[
augroup packer
au!
au BufWritePost plugins.lua source <afile> | PackerSync
augroup END ]]

vim.cmd [[
augroup options
au!
au VimLeave * set guicursor=a:ver25
au TextYankPost * silent! lua vim.highlight.on_yank {higroup="IncSearch"}
augroup END ]]

vim.cmd [[
augroup ftype
au!
au FileType * setlocal formatoptions=njcrql
au FileType lua nmap <silent><leader>r <cmd>source %<cr>
augroup END ]]

vim.cmd [[
augroup term
au!
au TermOpen * startinsert | setlocal signcolumn=no norelativenumber nonumber
au TermOpen * silent tnoremap <esc> <C-\><C-n>
augroup END ]]
