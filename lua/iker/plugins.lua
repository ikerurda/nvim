-- Configure packer
local packer = require "packer"
packer.init {
  auto_clean = true,
  compile_on_sync = true,
  display = { prompt_border = "rounded" },
}

-- Plugin list
packer.startup(function(use)
  use {
    "wbthomason/packer.nvim",
    "lewis6991/impatient.nvim",
    "nvim-lua/plenary.nvim",
  }

  use { -- LSP
    "neovim/nvim-lspconfig",
    "williamboman/nvim-lsp-installer",
    "jose-elias-alvarez/null-ls.nvim",
    "arkav/lualine-lsp-progress",
    "folke/lua-dev.nvim",
  }

  use { -- Completion
    "L3MON4D3/LuaSnip",
    "rafamadriz/friendly-snippets",
    "hrsh7th/nvim-cmp",
    "onsails/lspkind-nvim",
    "hrsh7th/cmp-nvim-lsp-signature-help",
    "hrsh7th/cmp-nvim-lsp",
    "saadparwaiz1/cmp_luasnip",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "dmitmel/cmp-digraphs",
    "hrsh7th/cmp-calc",
    "f3fora/cmp-spell",
  }

  use { -- Treesitter
    "nvim-treesitter/nvim-treesitter",
    "nvim-treesitter/nvim-treesitter-refactor",
    "nvim-treesitter/nvim-treesitter-textobjects",
  }

  use { -- Telescope
    "nvim-telescope/telescope.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
    "gbrlsnchs/telescope-lsp-handlers.nvim",
    {
      "nvim-telescope/telescope-file-browser.nvim",
      branch = "feat/previewer",
    },
    { "ikerurda/telescope-project.nvim", branch = "fix/file-browser" },
    { "ikerurda/telescope-packer.nvim", branch = "fix/file-browser" },
  }

  use { -- Tools
    "TimUntersberger/neogit",
    "lewis6991/gitsigns.nvim",
    "numToStr/Comment.nvim",
    "windwp/nvim-autopairs",
    "blackCauldron7/surround.nvim",
    "phaazon/hop.nvim",
  }

  use { -- Theming
    "projekt0n/github-nvim-theme",
    "nvim-lualine/lualine.nvim",
    "akinsho/bufferline.nvim",
    "lukas-reineke/indent-blankline.nvim",
    "norcalli/nvim-colorizer.lua",
  }
end)
