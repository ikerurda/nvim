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
	use "github/copilot.vim"
	use {
		"hrsh7th/nvim-cmp",
		requires = {
			"onsails/lspkind-nvim",
			"hrsh7th/cmp-nvim-lsp-signature-help",
			"windwp/nvim-autopairs",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-calc",
			"f3fora/cmp-spell",
			"hrsh7th/cmp-nvim-lsp",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
		}
	}

	-- Treesitter
	use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}
	use "nvim-treesitter/nvim-treesitter-refactor"
	use "nvim-treesitter/nvim-treesitter-textobjects"

	-- Telescope
	use "nvim-telescope/telescope.nvim"
	use {"nvim-telescope/telescope-fzf-native.nvim", run = "make"}
	use "gbrlsnchs/telescope-lsp-handlers.nvim"
	use "nvim-telescope/telescope-file-browser.nvim"
	use "ahmedkhalf/project.nvim"
	use "ikerurda/telescope-packer.nvim"
	use "nvim-telescope/telescope-symbols.nvim"

	-- Tools
	use "phaazon/hop.nvim"
	use "jghauser/mkdir.nvim"
	use {"numToStr/Comment.nvim", "blackCauldron7/surround.nvim"}
	use {"tpope/vim-fugitive", "lewis6991/gitsigns.nvim"}

	-- Theming
	use {"tjdevries/express_line.nvim", "nvim-lua/lsp-status.nvim", "akinsho/bufferline.nvim"}
	use {"lukas-reineke/indent-blankline.nvim", "norcalli/nvim-colorizer.lua"}
	use {"projekt0n/github-nvim-theme", "tjdevries/colorbuddy.nvim"}
end)
