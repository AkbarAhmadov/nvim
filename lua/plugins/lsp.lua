return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      vim.lsp.config("clangd", {
        cmd = { "clangd" },
        filetypes = { "c", "cpp" },
      })
      vim.lsp.enable("clangd")
    end,
  },
}
