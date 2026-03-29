return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")

      lspconfig.clangd.setup({
        cmd = {
          "clangd",
          "--fallback-style=google",
          "--clang-tidy",
        },
        root_dir = function(fname)
          return vim.fs.dirname(fname)
        end,
      })

      lspconfig.lua_ls.setup({})

      vim.diagnostic.config({
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = "󰅚",
            [vim.diagnostic.severity.WARN]  = "",
            [vim.diagnostic.severity.INFO]  = "󰋽",
            [vim.diagnostic.severity.HINT]  = "󰌶",
          },
        },
        virtual_text  = false,
        virtual_lines = false,
      })
    end,
  },
}
