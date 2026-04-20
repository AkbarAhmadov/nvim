return {
  "vyfor/cord.nvim",
  build = "./build",
  event = "VeryLazy",
  opts = {
    user_configs = {
      presence = {
        show_time = true,
        item_order = { "repository", "file", "location", "line" },
        editing_text = "Editing %s",
        file_browser_text = "Browsing files",
        plugin_manager_text = "Managing plugins",
        workspace_text = "In %s",
        status = "Coding...",
        send_presence_at_offset = 0,
      },
      
      display = {
        show_cursor_position = true,
        theme = "default",
      },
    },
  },
}
