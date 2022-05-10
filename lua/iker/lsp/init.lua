local has_installer, installer = pcall(require, "nvim-lsp-installer")
if not has_installer then
  return
end

local languageServers = {
  "sumneko_lua",
  "vimls",
  "clangd",
  "pylsp",
  "jdtls",
  "emmet_ls",
  "cssls",
  "tsserver",
  "intelephense",
  "bashls",
}

installer.setup {
  ensure_installed = languageServers,
  automatic_installation = true,
}

local lspconfig = require "lspconfig"
local configs = require "iker.lsp.configs"
for _, l in pairs(languageServers) do
  lspconfig[l].setup(configs[l] and configs[l] or configs.general)
end

-- Server status
require("fidget").setup { text = { spinner = "dots" } }
