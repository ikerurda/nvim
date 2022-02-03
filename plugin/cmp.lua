local has_cmp, cmp = pcall(require, "cmp")
if not has_cmp then
  return
end

local snip = require "luasnip"
snip.filetype_extend("javascript", { "javascriptreact" })
snip.filetype_extend("javascript", { "html" })
snip.filetype_extend("php", { "html" })
require("luasnip.loaders.from_vscode").lazy_load()

local kind = require "lspkind"
cmp.setup {
  mapping = {
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-c>"] = cmp.mapping.close(),
    ["<C-u>"] = cmp.mapping.scroll_docs(-4),
    ["<C-d>"] = cmp.mapping.scroll_docs(4),
    ["<CR>"] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Insert,
      select = false,
    },
  },
  sources = {
    { name = "nvim_lsp" },
    { name = "nvim_lsp_signature_help" },
    { name = "luasnip" },
    { name = "buffer", keyword_lenght = 5 },
    { name = "path" },
    { name = "digraphs" },
    { name = "calc" },
    { name = "spell" },
  },
  formatting = {
    format = kind.cmp_format {
      with_text = true,
      menu = {
        nvim_lsp = "[LSP]",
        nvim_lsp_signature_help = "[LSP]",
        buffer = "[buf]",
        path = "[path]",
        digraphs = "[dig]",
        luasnip = "[snip]",
        calc = "[calc]",
        spell = "[spell]",
      },
    },
  },
  snippet = {
    expand = function(args)
      snip.lsp_expand(args.body)
    end,
  },
  experimental = { ghost_text = true },
}

local map = vim.keymap.set
map({ "i", "s" }, "<c-j>", function()
  snip.jump(1)
end)
map({ "i", "s" }, "<c-k>", function()
  snip.jump(-1)
end)
