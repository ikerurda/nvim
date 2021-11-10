local download_packer = function()
	local directory = string.format("%s/site/pack/packer/start/", vim.fn.stdpath "data")
	vim.fn.mkdir(directory, "p")

	local cmd = string.format("git clone %s %s", "https://github.com/wbthomason/packer.nvim", directory .. "packer.nvim")
	local out = vim.fn.system(cmd)

	print(out)
	print "Downloading packer.nvim..."
	print "You'll need to restart now"
	print "Then run PackerInstall"
end

return function()
	if not pcall(require, "packer") then
		download_packer()
		FIRST_LOAD = true
		return true
	end
	return false
end
