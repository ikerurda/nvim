local download_packer = function()
  local data_dir = vim.fn.stdpath "data"
  local directory = data_dir .. "/site/pack/packer/start/"
  vim.fn.mkdir(directory, "p")

  local run = vim.fn.system
  print "Downloading packer.nvim... please wait"
  local url = "https://github.com/wbthomason/packer.nvim"
  run(string.format("git clone %s %s", url, directory .. "packer.nvim"))

  vim.cmd "packadd packer.nvim"
  print "Downloading plugins... please wait"
  local au = "autocmd User PackerComplete quitall"
  run("nvim --headless -c '" .. au .. "' -c 'PackerSync'")
end

if not pcall(require, "packer") then
  download_packer()
end
