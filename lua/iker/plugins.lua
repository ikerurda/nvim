-- Let packer configure itself
vim.cmd "packadd packer.nvim"

-- Configure packer
local packer = require "packer"
packer.init {
	auto_clean = true,
	compile_on_sync = true
}

-- Plugin list
return packer.startup(function(use)
	use "wbthomason/packer.nvim"
	use "lewis6991/impatient.nvim"
	use {"nvim-lua/popup.nvim", {"fdschmidt93/plenary.nvim", branch = "feat/recursive-copy"}} -- Waiting for pull request

	-- LSP
	use {"neovim/nvim-lspconfig", "williamboman/nvim-lsp-installer", "folke/lua-dev.nvim"}
	use "jose-elias-alvarez/null-ls.nvim"
	use {
		"hrsh7th/nvim-cmp",
		requires = {
			"onsails/lspkind-nvim",
			"ray-x/lsp_signature.nvim",
			"windwp/nvim-autopairs",
			"L3MON4D3/LuaSnip",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-calc",
			"f3fora/cmp-spell",
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-nvim-lsp",
			"saadparwaiz1/cmp_luasnip",
			"lukas-reineke/cmp-rg"
		}
	}

	-- Treesitter
	use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}
	use "nvim-treesitter/nvim-treesitter-refactor"
	use "nvim-treesitter/nvim-treesitter-textobjects"

	-- Telescope
	use "nvim-telescope/telescope.nvim"
	use {"nvim-telescope/telescope-fzf-native.nvim", run = "make"}
	use "nvim-telescope/telescope-file-browser.nvim"
	use "ahmedkhalf/project.nvim"
	use "ikerurda/telescope-packer.nvim"
	use "nvim-telescope/telescope-symbols.nvim"

	-- Tools
	use "phaazon/hop.nvim"
	use "jghauser/mkdir.nvim"
	use {"numToStr/Comment.nvim", "blackCauldron7/surround.nvim"}
	use {"lewis6991/gitsigns.nvim", "tpope/vim-fugitive"}

	-- Theming
	use "tjdevries/colorbuddy.nvim"
	use {"tjdevries/express_line.nvim", "akinsho/bufferline.nvim", "nvim-lua/lsp-status.nvim"}
	use {"lukas-reineke/indent-blankline.nvim", "norcalli/nvim-colorizer.lua"}
	use "projekt0n/github-nvim-theme"
end)
