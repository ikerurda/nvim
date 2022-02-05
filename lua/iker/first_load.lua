local download_packer = function()
  local directory = vim.fn.stdpath "data" .. "/site/pack/packer/start/"
  vim.fn.mkdir(directory, "p")

  print "Downloading packer.nvim... please wait"
  local run = vim.fn.system
  local url = "https://github.com/wbthomason/packer.nvim"
  run(string.format("git clone %s %s", url, directory .. "packer.nvim"))

  print "Downloading plugins... please wait"
  vim.cmd "packadd packer.nvim"
  local au = "autocmd User PackerComplete quitall"
  run("nvim --headless -c '" .. au .. "' -c 'PackerSync'")
end

if not pcall(require, "packer") then
  download_packer()
end
