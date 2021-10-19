-- Bootstrap
local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	vim.fn.system {"git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path}
end

local packer = require("packer")
packer.init {
	display = {open_fn = function() return require("packer.util").float {border = "single"} end, prompt_border = "single"},
	auto_clean = true,
	compile_on_sync = true
}

return packer.startup(function(use)
	use "wbthomason/packer.nvim"

	-- LSP
	use {"neovim/nvim-lspconfig", config = function() require("iker._langs") end}
	use {{"williamboman/nvim-lsp-installer"}, {"folke/lua-dev.nvim"}}
	use {
		"hrsh7th/nvim-cmp",
		requires = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-nvim-lua",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-calc",
			"f3fora/cmp-spell"
		}
	}
	use "ray-x/lsp_signature.nvim"
	use {
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup()
			require("nvim-autopairs.completion.cmp").setup {map_cr = true, map_complete = true}
		end
	}

	-- Debugger
	use "mfussenegger/nvim-dap"
	use {"rcarriga/nvim-dap-ui", config = function() require("dapui").setup() end}
	use {"theHamsta/nvim-dap-virtual-text", config = function() vim.g.dap_virtual_text = true end}
	use "Pocco81/DAPInstall.nvim"

	-- Treesitter
	use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}
	use {"lewis6991/spellsitter.nvim", config = function() require("spellsitter").setup() end}

	-- Telescope
	use {
		"nvim-telescope/telescope.nvim",
		requires = {{"nvim-lua/popup.nvim"}, {"nvim-lua/plenary.nvim"}},
		config = function() require("iker._telescope") end
	}
	use {"nvim-telescope/telescope-fzf-native.nvim", run = "make"}
	use "ikerurda/telescope-project.nvim"
	use "ikerurda/telescope-files.nvim"
	use "nvim-telescope/telescope-dap.nvim"
	use "ikerurda/telescope-packer.nvim"
	use "nvim-telescope/telescope-symbols.nvim"
	use "sudormrfbin/cheatsheet.nvim"

	-- Tools
	use {"folke/trouble.nvim", config = function() require("trouble").setup {icons = false} end}
	use {"folke/todo-comments.nvim", config = function() require("todo-comments").setup() end}
	use {"folke/which-key.nvim", config = function() require("iker._mappings") end}
	use {"karb94/neoscroll.nvim", config = function() require("neoscroll").setup() end}
	use {"tpope/vim-fugitive", "tpope/vim-rhubarb"}
	use {"lewis6991/gitsigns.nvim", config = function() require("gitsigns").setup {keymaps = {}} end}
	use {"terrortylor/nvim-comment", config = function() require("nvim_comment").setup() end}
	use {"blackCauldron7/surround.nvim", config = function() require("surround").setup {mappings_style = "sandwich"} end}
	use "sindrets/winshift.nvim"
	use {"jghauser/mkdir.nvim", config = function() require("mkdir") end}
	use {
		"akinsho/nvim-toggleterm.lua",
		config = function()
			vim.cmd("au TermOpen * setlocal signcolumn=no")
			require("toggleterm").setup {open_mapping = "<F2>", float_opts = {border = "curved", winblend = 1}}
		end
	}

	-- Top and Bottombar
	use {"hoob3rt/lualine.nvim", config = function() require("iker._statusline") end}

	-- Theming
	use {"norcalli/nvim-colorizer.lua", config = function() require("colorizer").setup() end}
	use {
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			require("indent_blankline").setup {
				filetype_exclude = {"help", "man", "packer", "NvimTree", "Trouble"},
				buftype_exclude = {"terminal"},
				bufname_exclude = {"Untitled"},
				use_treesitter = true
			}
		end
	}
	use {"folke/twilight.nvim", config = function() require("twilight").setup() end}
	use {"folke/zen-mode.nvim", config = function() require("zen-mode").setup() end}
	use {
		"projekt0n/github-nvim-theme",
		config = function()
			require("github-theme").setup({
				theme_style = "dark_default",
				sidebars = {"qf", "which_key", "toggleterm"},
				hide_inactive_statusline = false
			})
		end
	}
end)
