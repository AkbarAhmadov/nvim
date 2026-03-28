local map = vim.keymap.set

map("i", "<Tab>", function()
  local ok, ls = pcall(require, "luasnip")
  if ok and ls.expandable() then
    ls.expand()
  else
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, false, true), "n", false)
  end
end, { desc = "Snippet expand" })
