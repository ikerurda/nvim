local has_tl, tl = pcall(require, "telescope")
if not has_tl then
  return
end

-- TODO:
-- 1. propose my keymappings as default
-- 2. <A-e> wont ignore ../ and ./
-- 3. try to think of a way of setting this as theme = "..."
--    (see https://github.com/nvim-telescope/telescope.nvim/issues/938)
local themes = require "telescope.themes"
local layout_actions = require "telescope.actions.layout"
local fb_actions = require("telescope").extensions.file_browser.actions
tl.setup {
  defaults = themes.get_dropdown {
    winblend = 10,
    path_display = { "truncate" },
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
      previewer = false,
      dir_icon = "#",
      respect_gitignore = false,
      mappings = {
        i = {
          ["<A-c>"] = fb_actions.create_file,
          ["<A-d>"] = fb_actions.remove_file,
          ["<A-r>"] = fb_actions.rename_file,
          ["<A-m>"] = fb_actions.move_file,
          ["<A-y>"] = fb_actions.copy_file,
          ["<C-t>"] = fb_actions.change_cwd,
          ["<C-e>"] = fb_actions.goto_home_dir,
          ["<C-a>"] = fb_actions.toggle_all,
          ["<C-d>"] = "preview_scrolling_down",
          ["<A-e>"] = false,
          ["<C-r>"] = false,
          ["<C-y>"] = false,
        },
      },
    },
    packer = { previewer = false, layout_config = { height = 0.5 } },
  },
}

tl.load_extension "fzf"
tl.load_extension "lsp_handlers"
tl.load_extension "file_browser"
tl.load_extension "project"
tl.load_extension "packer"
