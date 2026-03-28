return {
  {
    "folke/snacks.nvim",
    opts = {},
    config = function()
      vim.api.nvim_set_hl(0, "FloatBorder",        { fg = "#7aa2f7", bold = true, underline = false })
      vim.api.nvim_set_hl(0, "NormalFloat",         { bg = "NONE" })
      vim.api.nvim_set_hl(0, "TelescopeBorder",     { fg = "#7aa2f7", bold = true })
      vim.api.nvim_set_hl(0, "TelescopePromptBorder",{ fg = "#bb9af7", bold = true })
      vim.api.nvim_set_hl(0, "TelescopeResultsBorder",{ fg = "#7aa2f7", bold = true })
      vim.api.nvim_set_hl(0, "TelescopePreviewBorder",{ fg = "#2ac3de", bold = true })
      vim.api.nvim_set_hl(0, "NeoTreeFloatBorder",  { fg = "#7aa2f7", bold = true })
      vim.api.nvim_set_hl(0, "LazyNormal",          { bg = "NONE" })
      vim.api.nvim_set_hl(0, "LazyBorder",          { fg = "#7aa2f7", bold = true })
      vim.api.nvim_set_hl(0, "NoiceCmdlinePopupBorder", { fg = "#bb9af7", bold = true })
      vim.api.nvim_set_hl(0, "NoicePopupBorder",    { fg = "#7aa2f7", bold = true })
      vim.api.nvim_set_hl(0, "DiagnosticFloatingBorder", { fg = "#ff6c6b", bold = true })
    end,
  },
}
