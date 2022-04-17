local user = vim.api.nvim_create_augroup("user", { clear = true })

vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank { higroup = "IncSearch" }
  end,
  group = user,
})

vim.api.nvim_create_autocmd("TermOpen", {
  callback = function()
    vim.cmd "startinsert"
    vim.opt_local.signcolumn = "no"
    vim.opt_local.relativenumber = false
    vim.opt_local.number = false
    vim.keymap.set("t", "<esc>", "<C-\\><C-n>", { buffer = true })
  end,
  group = user,
})

vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "plugins.lua",
  command = "source % | PackerSync",
  group = user,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "lua",
  callback = function()
    vim.keymap.set("n", "<leader>r", "<cmd>source %<cr>", { buffer = true })
  end,
  group = user,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "zsh",
  callback = function()
    vim.keymap.set(
      "n",
      "<leader>r",
      "<cmd>silent !source ~/.zshrc<cr>",
      { buffer = true }
    )
  end,
  group = user,
})

vim.api.nvim_create_autocmd("FileType", {
  callback = function()
    vim.opt_local.formatoptions = "njcrql"
  end,
  group = user,
})

vim.api.nvim_create_autocmd("VimLeave", {
  callback = function()
    vim.opt.guicursor = "a:hor25"
  end,
  group = user,
})
