local has_cmp, cmp = pcall(require, "cmp")
if not has_cmp then
  return
end

local snip = require "luasnip"
snip.filetype_extend("javascript", { "javascriptreact" })
snip.filetype_extend("javascript", { "html" })
snip.filetype_extend("php", { "html" })
require("luasnip.loaders.from_vscode").lazy_load()

local pairs = require "nvim-autopairs.completion.cmp"
cmp.event:on("confirm_done", pairs.on_confirm_done { map_char = { tex = "" } })

local kind = require "lspkind"
cmp.setup {
  mapping = {
    ["<c-space>"] = cmp.mapping.complete(),
    ["<c-c>"] = cmp.mapping.close(),
    ["<c-u>"] = cmp.mapping.scroll_docs(-4),
    ["<c-d>"] = cmp.mapping.scroll_docs(4),
    ["<cr>"] = cmp.mapping.confirm {
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
