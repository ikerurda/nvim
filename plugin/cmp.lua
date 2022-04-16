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
local lsnip = require "luasnip"
cmp.setup {
  mapping = {
    ["<c-space>"] = cmp.mapping.complete(),
    ["<c-c>"] = cmp.mapping.close(),
    ["<c-n>"] = cmp.mapping(function()
      if cmp.visible() then
        cmp.select_next_item()
      end
    end),
    ["<c-p>"] = cmp.mapping(function()
      if cmp.visible() then
        cmp.select_prev_item()
      end
    end),
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
      lsnip.lsp_expand(args.body)
    end,
  },
  experimental = { ghost_text = true },
}

-- Snippets
-- check https://youtu.be/KtQZRAkgLqo
lsnip.config.set_config {
  history = true,
  update_events = "TextChanged,TextChangedI",
}

local snp, ins = lsnip.snippet, lsnip.insert_node
local fmt = require("luasnip.extras.fmt").fmt
local fun, cho, txt = lsnip.function_node, lsnip.choice_node, lsnip.text_node
local rep = require("luasnip.extras").rep
require("luasnip.loaders.from_vscode").lazy_load()
lsnip.filetype_extend("javascript", { "javascriptreact" })
lsnip.filetype_extend("javascript", { "html" })
lsnip.filetype_extend("php", { "html" })
lsnip.add_snippets("all", {
  snp(
    "curtime",
    fun(function()
      return os.date "%D - %H:%M"
    end)
  ),
})
lsnip.add_snippets("lua", {
  snp(
    "req",
    fmt('local {} = require "{}"', {
      fun(function(name)
        local parts = vim.split(name[1][1], ".", true)
        return parts[#parts] or ""
      end, { 1 }),
      ins(1),
    })
  ),
  snp("todo", fmt("{}", { cho(1, { txt "-- TODO: ", txt "-- FIXME: " }) })),
})

local map = vim.keymap.set
map({ "i", "s" }, "<c-j>", function()
  if lsnip.expand_or_jumpable() then
    lsnip.expand_or_jump()
  end
end)
map({ "i", "s" }, "<c-k>", function()
  if lsnip.jumpable(-1) then
    lsnip.jump(-1)
  end
end)
map({ "i", "s" }, "<c-l>", function()
  if lsnip.choice_active() then
    lsnip.change_choice(1)
  end
end)
