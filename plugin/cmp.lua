local has_cmp, cmp = pcall(require, "cmp")
if not has_cmp then return end

local snip = require "luasnip"
local kind = require "lspkind"

cmp.setup {
	mapping = {
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-c>"] = cmp.mapping.close(),
		["<C-u>"] = cmp.mapping.scroll_docs(-4),
		["<C-d>"] = cmp.mapping.scroll_docs(4),
		["<CR>"] = cmp.mapping.confirm {
			behavior = cmp.ConfirmBehavior.Insert,
			select = false
		}
	},
	sources = {
		{name = "nvim_lsp"},
		{name = "nvim_lsp_signature_help"},
		{name = "luasnip"},
		{name = "buffer", keyword_lenght = 5},
		{name = "path"},
		{name = "calc"},
		{name = "digraphs"},
		{name = "spell"}
	},
	formatting = {
		format = kind.cmp_format {
			with_text = true,
			menu = {
				nvim_lsp = "[LSP]",
				nvim_lsp_signature_help = "[LSP]",
				buffer = "[buf]",
				path = "[path]",
				luasnip = "[snip]",
				calc = "[calc]",
				digraphs = "[dig]",
				spell = "[spell]"
			}
		}
	},
	snippet = {expand = function(args) snip.lsp_expand(args.body) end},
	experimental = {ghost_text = true}
}

vim.cmd [[
imap <silent><expr> <c-j> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<c-j>'
imap <silent><expr> <c-k> luasnip#expand_or_jumpable() ? '<Plug>luasnip-jump-prev' : '<c-k>'
snoremap <silent> <c-j> <cmd>lua require('luasnip').jump(1)<CR>
snoremap <silent> <c-k> <cmd>lua require('luasnip').jump(-1)<CR>
]]
