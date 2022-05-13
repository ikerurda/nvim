local has_gs, gs = pcall(require, "gitsigns")
if not has_gs then
  return
end

gs.setup { keymaps = {} }

require("Comment").setup { ignore = "^$" }

require("surround").setup {
  mappings_style = "surround",
  map_insert_mode = false,
}

require("leap").set_default_keymaps()

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
  dev = true,
  overrides = function(c)
    return {
      VertSplit = { fg = c.fg_dark },
      ColorColumn = { bg = c.bg_highlight },
      GitSignsAdd = { fg = c.green },
      GitSignsChange = { fg = c.magenta },
      GitSignsDelete = { fg = c.red },
      LeapMatch = { fg = c.red, style = "underline,bold" },
      LeapLabelPrimary = { bg = c.red, fg = c.bg },
      LeapLabelSecondary = { fg = c.blue },
      LeapBackdrop = { fg = c.syntax.comment, bg = c.bg },
      FidgetTitle = { fg = c.syntax.comment, bg = c.bg },
      TelescopePromptCounter = { fg = c.syntax.comment, bg = c.bg },
    }
  end,
}

require("bufferline").setup {
  options = {
    diagnostics = false,
    show_buffer_icons = false,
    show_close_icon = false,
    always_show_bufferline = false,
  },
}

require("dressing").setup {}
