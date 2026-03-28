return {
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup({})

      local cmp_autopairs = require("nvim-autopairs.completion.cmp")
      local cmp_events = require("blink.cmp.config").keymap
      vim.api.nvim_create_autocmd("User", {
        pattern = "BlinkCmpAccept",
        callback = function(args)
          cmp_autopairs.on_confirm_done()(args)
        end,
      })
    end,
  },
}
