-- Packer manages itself
vim.cmd "packadd packer.nvim"

local packer = require "packer"
packer.init {
	display = {open_fn = function() return require"packer.util".float {border = "single"} end, prompt_border = "single"},
	auto_clean = true,
	compile_on_sync = true
}

return packer.startup(function(use)
	use "wbthomason/packer.nvim"
	use "lewis6991/impatient.nvim"
	use {"nvim-lua/popup.nvim", {"fdschmidt93/plenary.nvim", branch = "feat/recursive-copy"}} -- Waiting for pull request

	-- LSP
	use {"neovim/nvim-lspconfig", "williamboman/nvim-lsp-installer", "folke/lua-dev.nvim"}
	use "nvim-lua/lsp-status.nvim"
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
			"saadparwaiz1/cmp_luasnip"
		}
	}

	-- Treesitter
	use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}
	use "nvim-treesitter/nvim-treesitter-refactor"
	use "nvim-treesitter/nvim-treesitter-textobjects"

	-- Telescope
	use {"fdschmidt93/telescope.nvim", branch = "feat/fb-improvements"}
	use {"nvim-telescope/telescope-fzf-native.nvim", run = "make"}
	use "ahmedkhalf/project.nvim"
	use "ikerurda/telescope-packer.nvim"
	use "nvim-telescope/telescope-symbols.nvim"

	-- Tools
	use "jghauser/mkdir.nvim"
	use {"numToStr/Comment.nvim", "blackCauldron7/surround.nvim"}
	use "lewis6991/gitsigns.nvim"
	use {"tpope/vim-fugitive", config = function() vim.g.fugitive_legacy_commands = false end}

	-- Theming
	use "tjdevries/colorbuddy.nvim"
	use {"tjdevries/express_line.nvim", "akinsho/bufferline.nvim"}
	use {"lukas-reineke/indent-blankline.nvim", "norcalli/nvim-colorizer.lua"}
	use "projekt0n/github-nvim-theme"
end)
