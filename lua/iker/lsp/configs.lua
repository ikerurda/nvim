-- Null lsp
local null = require "null-ls"
null.setup {
  sources = {
    null.builtins.formatting.stylua,
    null.builtins.formatting.prettier,
    null.builtins.formatting.yapf,
  },
}

-- Extended capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- Custom on_attach
local on_attach = function(client, bufnr)
  local map = vim.keymap.set
  map("n", "gd", vim.lsp.buf.definition, { buffer = bufnr })
  map("n", "gD", vim.lsp.buf.declaration, { buffer = bufnr })
  map("n", "gt", vim.lsp.buf.type_definition, { buffer = bufnr })
  map("n", "gi", vim.lsp.buf.implementation, { buffer = bufnr })
  map("n", "gR", vim.lsp.buf.references, { buffer = bufnr })
  map("n", "gp", vim.diagnostic.goto_prev, { buffer = bufnr })
  map("n", "gn", vim.diagnostic.goto_next, { buffer = bufnr })
  map("n", "K", vim.lsp.buf.hover, { buffer = bufnr })
  map({ "n", "i" }, "<c-s>", vim.lsp.buf.signature_help, { buffer = bufnr })
  map("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = bufnr })
  map("n", "<leader>cf", vim.lsp.buf.formatting_sync, { buffer = bufnr })
  map("v", "<leader>cf", vim.lsp.buf.range_formatting, { buffer = bufnr })

  local disable_formatting = { "pylsp", "tsserver" }
  if vim.tbl_contains(disable_formatting, client.name) then
    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false
  end
end

-- Configs for the language servers
local M = {}
M.general = { capabilities = capabilities, on_attach = on_attach }
M.sumneko_lua = require("lua-dev").setup { lspconfig = M.general }
M.pylsp = vim.tbl_deep_extend("force", {
  settings = {
    pylsp = { plugins = { jedi_completion = { include_params = true } } },
  },
}, M.general)
M.cssls = vim.tbl_deep_extend("force", {
  settings = { css = { validate = false } },
}, M.general)
return M
