local has_buf, buf = pcall(require, "bufferline")
if not has_buf then
  return
end

buf.setup {
  options = {
    numbers = "none",
    close_command = "bdelete! %d",
    right_mouse_command = "bdelete! %d",
    left_mouse_command = "buffer %d",
    middle_mouse_command = nil,
    indicator_icon = "▎",
    buffer_close_icon = "",
    modified_icon = "●",
    close_icon = "",
    left_trunc_marker = "",
    right_trunc_marker = "",
    max_name_length = 18,
    max_prefix_length = 15,
    tab_size = 18,
    diagnostics = "none",
    diagnostics_update_in_insert = false,
    show_buffer_icons = false,
    show_buffer_close_icons = true,
    show_close_icon = false,
    show_tab_indicators = true,
    persist_buffer_sort = true,
    separator_style = "thick",
    enforce_regular_tabs = false,
    always_show_bufferline = false,
    sort_by = "id",
    custom_filter = function(buf_number)
      if vim.bo[buf_number].filetype ~= "NeogitStatus" then
        return true
      end
    end,
  },
}
