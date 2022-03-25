local has_installer, installer = pcall(require, "nvim-lsp-installer")
if not has_installer then
  return
end

-- List of language servers to automatically install
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

-- Automatic installation
local lspInstaller = require "nvim-lsp-installer.servers"
for _, l in pairs(languageServers) do
  local ok, s = lspInstaller.get_server(l)
  if ok then
    if not s:is_installed() then
      s:install()
    end
  end
end

-- Apply configs
local configs = require "iker.lsp.configs"
installer.on_server_ready(function(server)
  if configs[server.name] then
    server:setup(configs[server.name])
  else
    server:setup(configs.general)
  end
  vim.cmd "do User LspAttachBuffers"
end)

-- Server logs
require("fidget").setup { text = { spinner = "dots" } }
