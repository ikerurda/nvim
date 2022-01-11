local has_tl, tl = pcall(require, "telescope")
if not has_tl then
  return
end

local themes = require "telescope.themes"
local layout_actions = require "telescope.actions.layout"
tl.setup {
  defaults = themes.get_dropdown {
    winblend = 10,
    prompt_prefix = " ",
    selection_caret = "  ",
    multi_icon = " ",
    path_display = { "smart" },
    mappings = {
      i = {
        ["<esc>"] = "close",
        ["<c-space>"] = layout_actions.toggle_preview,
      },
    },
  },
  pickers = {
    oldfiles = { previewer = false },
    lsp_code_actions = { theme = "cursor" },
    buffers = {
      previewer = false,
      ignore_current_buffer = true,
      sort_mru = true,
      mappings = {
        i = { ["<C-d>"] = "delete_buffer" },
        n = { ["<C-d>"] = "delete_buffer" },
      },
    },
  },
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case",
    },
    file_browser = {
      dir_icon = "#",
      previewer = false,
      path_display = { ["truncate"] = 3 },
      cwd_to_path = true,
      respect_gitignore = false,
    },
    packer = { previewer = false, layout_config = { height = 0.5 } },
  },
}

tl.load_extension "fzf"
tl.load_extension "lsp_handlers"
tl.load_extension "file_browser"
tl.load_extension "project"
tl.load_extension "packer"
