local has_tl, tl = pcall(require, "telescope")
if not has_tl then
  return
end

local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"
local layout_actions = require "telescope.actions.layout"
local Path = require "plenary.path"

local builtin = require "telescope.builtin"
local open_in = function(finder)
  return function(prompt_bufnr)
    local current_picker = action_state.get_current_picker(prompt_bufnr)
    local path = current_picker.finder.path
    actions._close(prompt_bufnr, true)
    finder { cwd = path }
  end
end

local open_in_fb = function(prompt_bufnr)
  local fb = require("telescope").extensions.file_browser.file_browser
  local entry = action_state.get_selected_entry()[1]
  local entry_path = Path:new(entry):parent():absolute()
  actions._close(prompt_bufnr, true)
  fb { path = entry_path }
end

local bookmarks = {
  ["config"] = "~/.config/nvim",
  ["web"] = "~/Sites",
  ["plugins"] = "~/.local/share/nvim/site/pack/packer/start/",
}

local open_bookmark = function(prompt_bufnr)
  local fb_utils = require "telescope._extensions.file_browser.utils"
  local current_picker = action_state.get_current_picker(prompt_bufnr)
  local finder = current_picker.finder

  if not bookmarks or vim.tbl_isempty(bookmarks) then
    print "[telescope] Please set some bookmarks first"
    return
  end

  vim.ui.select(
    vim.tbl_keys(bookmarks),
    { prompt = "Select bookmark:" },
    function(selection)
      if selection then
        finder.path = vim.fn.expand(bookmarks[selection])
        fb_utils.redraw_border_title(current_picker)
        current_picker:refresh(
          finder,
          { reset_prompt = true, multi = current_picker._multi }
        )
      end
    end
  )
end

tl.setup {
  defaults = {
    winblend = 10,
    prompt_prefix = " ",
    selection_caret = "  ",
    multi_icon = "• ",
    path_display = { ["truncate"] = 3 },
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
      n = { ["<space>"] = layout_actions.toggle_preview },
    },
  },
  pickers = {
    oldfiles = {
      mappings = {
        i = { ["<a-e>"] = open_in_fb },
        n = { ["<a-e>"] = open_in_fb },
      },
    },
    find_files = {
      mappings = {
        i = { ["<a-e>"] = open_in_fb },
        n = { ["<a-e>"] = open_in_fb },
      },
    },
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
      dir_preview = function(path)
        path = Path:new(path):make_relative(vim.loop.cwd())
        return "tree -F --noreport " .. path .. " | less -Sq"
      end,
      grouped = true,
      cwd_to_path = true,
      open_file = true,
      respect_gitignore = false,
      mappings = {
        i = {
          ["<a-f>"] = open_in(builtin.find_files),
          ["<a-g>"] = open_in(builtin.live_grep),
          ["<c-b>"] = open_bookmark,
        },
        n = {
          ["<a-f>"] = open_in(builtin.find_files),
          ["<a-g>"] = open_in(builtin.live_grep),
          ["b"] = open_bookmark,
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
