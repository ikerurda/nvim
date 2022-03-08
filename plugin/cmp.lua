local has_cmp, cmp = pcall(require, "cmp")
if not has_cmp then
  return
end

-- Autopairs
local pairs = require "nvim-autopairs.completion.cmp"
cmp.event:on("confirm_done", pairs.on_confirm_done { map_char = { tex = "" } })
require("nvim-autopairs").setup {
  check_ts = true,
  enable_moveright = false,
  fast_wrap = {},
}

-- Cmp
local kind = require "lspkind"
local snip = require "luasnip"
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

-- Snippets
snip.config.set_config {
  history = true,
  updateevents = "TextChanged,TextChangedI",
}

local s = snip.s
local i = snip.insert_node
local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep
require("luasnip.loaders.from_vscode").lazy_load()
snip.filetype_extend("javascript", { "javascriptreact" })
snip.filetype_extend("javascript", { "html" })
snip.filetype_extend("php", { "html" })
snip.snippets = {
  lua = {
    s("req", fmt('local {} = require "{}"', { i(1, "module"), rep(1) })),
  },
}

local map = vim.keymap.set
map({ "i", "s" }, "<c-j>", function()
  if snip.expand_or_jumpable() then
    snip.expand_or_jump()
  end
end)
map({ "i", "s" }, "<c-k>", function()
  if snip.jumpable(-1) then
    snip.jump(-1)
  end
end)
map({ "i", "s" }, "<c-l>", function()
  if snip.choice_active() then
    snip.change_choice(1)
  end
end)
