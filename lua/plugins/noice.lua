return {
  {
    "folke/noice.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    config = function()
      require("noice").setup({
        cmdline = {
          enabled = true,
          view = "cmdline_popup",
          opts = {
            position = { row = "90%", col = "75%" },
            size = { width = 40, height = 1 },
            border = { style = "rounded" },
          },
        },
        notify   = { enabled = true },
        messages = { enabled = true },
        popupmenu = { enabled = true },
        lsp = {
          progress  = { enabled = true },
          hover     = { enabled = true },
          signature = { enabled = true },
        },
        presets = {
          long_message_to_split = true,
        },
        routes = {
          {
            filter = { event = "msg_show", kind = "search_count" },
            opts   = { skip = true },
          },
        },
        override = {
          ["vim.ui.input"] = false,
        },
      })
      vim.api.nvim_set_hl(0, "NotifyBorder",      { fg = "#5c6370", bold = true })
      vim.api.nvim_set_hl(0, "NotifyERRORBorder",  { fg = "#5c6370", bold = true })
      vim.api.nvim_set_hl(0, "NotifyWARNBorder",   { fg = "#5c6370", bold = true })
      vim.api.nvim_set_hl(0, "NotifyINFOBorder",   { fg = "#5c6370", bold = true })
      vim.api.nvim_set_hl(0, "NotifyDEBUGBorder",  { fg = "#5c6370", bold = true })
      vim.api.nvim_set_hl(0, "NotifyTRACEBorder",  { fg = "#5c6370", bold = true })
      vim.api.nvim_set_hl(0, "NotifyERRORBody",    { bg = "NONE" })
      vim.api.nvim_set_hl(0, "NotifyWARNBody",     { bg = "NONE" })
      vim.api.nvim_set_hl(0, "NotifyINFOBody",     { bg = "NONE" })
      require("notify").setup({
        background_colour = "NONE",
        position = "top_right",
        timeout = 3000,
        render = "wrapped-compact",
        stages = "static",
        fps = 60,
        on_open = function(win)
          local config = vim.api.nvim_win_get_config(win)
          config.border = "rounded"
          config.width = config.width + 6
          vim.api.nvim_win_set_config(win, config)
        end,
      })
    end,
  },
}
