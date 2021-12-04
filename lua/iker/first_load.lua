local download_packer = function()
	local directory = string.format("%s/site/pack/packer/start/", vim.fn.stdpath "data")
	vim.fn.mkdir(directory, "p")

	print "Downloading packer.nvim... please wait"
	local cmd = string.format("git clone %s %s", "https://github.com/wbthomason/packer.nvim", directory .. "packer.nvim")
	vim.fn.system(cmd)

	print "Downloading plugins... please wait"
	vim.fn.system("nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'")
	print("Done!")
end

if not pcall(require, "packer") then
	download_packer()
end
