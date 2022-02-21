local has_ll, ll = pcall(require, "lualine")
if not has_ll then
  return
end

local colors = {
  fg = "#c9d1d9",
  black = "#161b22",
}

local my_theme = {
  normal = {
    a = { bg = colors.black, fg = colors.fg, gui = "bold" },
    b = { bg = colors.black, fg = colors.fg },
    c = { bg = colors.black, fg = colors.fg },
  },
}

ll.setup {
  options = {
    theme = my_theme,
    icons_enabled = false,
    component_separators = "",
    section_separators = "",
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = {
      "branch",
      {
        "diff",
        colored = false,
        symbols = { added = "+", modified = "~", removed = "-" },
      },
    },
    lualine_c = {
      "%=",
      {
        "filename",
        file_status = true,
        path = 1,
        shorting_target = 50,
        symbols = { modified = ",+", readonly = ",-" },
      },
    },
    lualine_x = {
      {
        "diagnostics",
        sources = { "nvim_diagnostic" },
        sections = { "error", "warn", "info", "hint" },
        symbols = { error = "E", warn = "W", info = "I", hint = "H" },
        colored = false,
        update_in_insert = false,
        always_visible = false,
      },
    },
    lualine_y = {
      "progress",
    },
    lualine_z = { "%l/%L:%c" },
  },
  inactive_sections = {
    lualine_c = {
      {
        "filename",
        file_status = true,
        path = 0,
        shorting_target = 50,
        symbols = { modified = ",+", readonly = ",-" },
      },
    },
  },
}
