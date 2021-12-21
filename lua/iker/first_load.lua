local download_packer = function()
	local data_dir = vim.fn.stdpath "data"
	local directory = data_dir.."/site/pack/packer/start/"
	vim.fn.mkdir(directory, "p")

	print "Downloading packer.nvim... please wait"
	local url = "https://github.com/wbthomason/packer.nvim"
	local cmd = string.format("git clone %s %s", url, directory.."packer.nvim")
	vim.fn.system(cmd)
	vim.cmd "packadd packer.nvim"

	print "Downloading plugins... please wait"
	local au = "autocmd User PackerComplete quitall"
	vim.fn.system("nvim --headless -c '"..au.."' -c 'PackerSync'")
	print("Done!")
end

if not pcall(require, "packer") then download_packer() end
