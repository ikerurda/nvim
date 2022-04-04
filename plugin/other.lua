if not pcall(require, "hop") then
  return
end

-- Configuration for other small plugins
require("gitsigns").setup { keymaps = {} }
require("Comment").setup { ignore = "^$" }
require("surround").setup {}
require("hop").setup { jump_on_sole_occurrence = true }
require("colorizer").setup({}, { mode = "foreground" })
require("indent_blankline").setup {
  filetype_exclude = { "help", "man", "packer" },
  buftype_exclude = { "terminal" },
  bufname_exclude = { "Untitled" },
  show_trailing_blankline_indent = false,
  show_end_of_line = true,
  use_treesitter = true,
  show_first_indent_level = false,
}
require("github-theme").setup {
  theme_style = "dark_default",
  hide_inactive_statusline = false,
  overrides = function(c)
    return {
      VertSplit = { fg = c.fg_dark },
      ColorColumn = { bg = c.bg_highlight },
      GitSignsAdd = { fg = c.green },
      GitSignsChange = { fg = c.magenta },
      GitSignsDelete = { fg = c.red },
    }
  end,
}
vim.api.nvim_set_hl(0, "FidgetTitle", {link = "Comment"})
