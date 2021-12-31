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
local on_attach = function(bufnr)
  local function map(m, k, c)
    local opts = { noremap = true, silent = true }
    vim.api.nvim_buf_set_keymap(bufnr, m, k, c, opts)
  end
  map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>")
  map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>")
  map("n", "gt", "<cmd>lua vim.lsp.buf.type_definition()<cr>")
  map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>")
  map("n", "gr", "<cmd>lua vim.lsp.buf.rename()<cr>")
  map("n", "gR", "<cmd>lua vim.lsp.buf.references()<cr>")
  map("n", "gp", "<cmd>lua vim.diagnostic.goto_prev()<cr>")
  map("n", "gn", "<cmd>lua vim.diagnostic.goto_next()<cr>")
  map("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>")
  map("i", "<c-s>", "<cmd>lua vim.lsp.buf.signature_help()<cr>")
  map("n", "<c-s>", "<cmd>lua vim.lsp.buf.signature_help()<cr>")
  map("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<cr>")
  map("n", "<leader>cf", "<cmd>lua vim.lsp.buf.formatting_sync()<CR>")
  map("v", "<leader>cf", "<cmd>lua vim.lsp.buf.range_formatting()<CR>")
end

-- Configs for the language servers
local M = {}
M.general = { capabilities = capabilities, on_attach = on_attach }
M.sumneko_lua = require("lua-dev").setup {
  library = { vimruntime = true, types = true, plugins = true },
  lspconfig = M.general,
}
M.pylsp = vim.tbl_deep_extend("force", {
  settings = {
    pylsp = { plugins = { jedi_completion = { include_params = true } } },
  },
}, M.general)
M.cssls = vim.tbl_deep_extend(
  "force",
  { settings = {
    css = { validate = false },
  } },
  M.general
)
return M
