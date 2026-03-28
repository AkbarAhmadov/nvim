return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
      require("which-key").setup({
        delay = 500,
        icons = { mappings = false },
        win = {
          border = "rounded",
        },
        triggers = {
          { "<leader>k", mode = { "n" } },
        },
      })
    end,
  },
}

