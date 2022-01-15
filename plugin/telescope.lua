local has_tl, tl = pcall(require, "telescope")
if not has_tl then
  return
end

local builtin = require "telescope.builtin"
local open_in = function(finder)
  return function(prompt_bufnr)
    local actions = require "telescope.actions"
    local action_state = require "telescope.actions.state"
    local entry_path = action_state.get_selected_entry().Path
    local path = entry_path:is_dir() and entry_path:absolute()
      or entry_path:parent():absolute()
    actions._close(prompt_bufnr, true)
    finder { cwd = path }
  end
end

local layout_actions = require "telescope.actions.layout"
tl.setup {
  defaults = {
    winblend = 10,
    prompt_prefix = " ",
    selection_caret = "  ",
    multi_icon = "• ",
    path_display = { "smart" },
    dynamic_preview_title = true,
    sorting_strategy = "ascending",
    layout_strategy = "vertical",
    layout_config = {
      vertical = {
        prompt_position = "top",
        mirror = true,
        preview_cutoff = 30,
      },
    },
    mappings = {
      i = { ["<c-space>"] = layout_actions.toggle_preview },
    },
  },
  pickers = {
    buffers = {
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
      path_display = { ["truncate"] = 3 },
      cwd_to_path = true,
      grouped = true,
      respect_gitignore = false,
      mappings = {
        i = {
          ["<a-f>"] = open_in(builtin.find_files),
          ["<a-g>"] = open_in(builtin.live_grep),
        },
      },
    },
    packer = {
      theme = "dropdown",
      previewer = false,
      layout_config = { height = 0.5 },
    },
  },
}

tl.load_extension "fzf"
tl.load_extension "lsp_handlers"
tl.load_extension "file_browser"
tl.load_extension "packer"
