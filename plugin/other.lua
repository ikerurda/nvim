local has_gs, gs = pcall(require, "gitsigns")
if not has_gs then
  return
end

-- Configuration for other small plugins
gs.setup { keymaps = {} }
require("Comment").setup { ignore = "^$" }
require("surround").setup {
  mappings_style = "surround",
  map_insert_mode = false,
}
require("lightspeed").setup { ignore_case = true }
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
vim.api.nvim_set_hl(0, "FidgetTitle", { link = "Comment" })
vim.notify = require "notify"
require("notify").setup {
  level = "info",
  stages = "static",
  render = "minimal",
  timeout = 2000,
}
require("bufferline").setup {
  options = {
    diagnostics = false,
    show_buffer_icons = false,
    show_close_icon = false,
    always_show_bufferline = false,
  },
}
