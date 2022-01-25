-- Configure packer
local packer = require "packer"
packer.init {
  auto_clean = true,
  compile_on_sync = true,
  display = { prompt_border = "rounded" },
}

-- Plugin list
packer.startup(function(use)
  use "wbthomason/packer.nvim"
  use "lewis6991/impatient.nvim"
  use "nvim-lua/plenary.nvim"

  -- LSP
  use {
    "neovim/nvim-lspconfig",
    "williamboman/nvim-lsp-installer",
    "folke/lua-dev.nvim",
    "jose-elias-alvarez/null-ls.nvim",
    "arkav/lualine-lsp-progress",
  }

  -- Completion
  use {
    "hrsh7th/nvim-cmp",
    requires = {
      "onsails/lspkind-nvim",
      "hrsh7th/cmp-nvim-lsp-signature-help",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "dmitmel/cmp-digraphs",
      "hrsh7th/cmp-calc",
      "f3fora/cmp-spell",
      "hrsh7th/cmp-nvim-lsp",
      "rafamadriz/friendly-snippets", -- collection
      "L3MON4D3/LuaSnip", -- engine
      "saadparwaiz1/cmp_luasnip", -- source
    },
  }

  -- Treesitter
  use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }
  use "nvim-treesitter/nvim-treesitter-refactor"
  use "nvim-treesitter/nvim-treesitter-textobjects"

  -- Telescope
  use "nvim-telescope/telescope.nvim"
  use { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }
  use "gbrlsnchs/telescope-lsp-handlers.nvim"
  use {
    "nvim-telescope/telescope-file-browser.nvim",
    branch = "feat/previewer",
  }
  use "nvim-telescope/telescope-packer.nvim"

  -- Tools
  use { "phaazon/hop.nvim", "numToStr/Comment.nvim" }
  use { "windwp/nvim-autopairs", "blackCauldron7/surround.nvim" }
  use { "tpope/vim-fugitive", "lewis6991/gitsigns.nvim" }

  -- Theming
  use "projekt0n/github-nvim-theme"
  use { "lukas-reineke/indent-blankline.nvim", "norcalli/nvim-colorizer.lua" }
  use { "nvim-lualine/lualine.nvim", "akinsho/bufferline.nvim" }
end)
