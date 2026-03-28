return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
      ensure_installed = { "cpp", "c", "lua" },
      highlight = { enable = true },
    },
  },
}
