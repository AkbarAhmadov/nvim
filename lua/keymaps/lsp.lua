local map = vim.keymap.set

map("n", "K",          vim.lsp.buf.hover,         { desc = "Documentation" })
map("n", "gd",         vim.lsp.buf.definition,    { desc = "Go to definition" })
map("n", "<leader>r",  vim.lsp.buf.rename,        { desc = "Rename" })
map("n", "<leader>a",  vim.lsp.buf.code_action,   { desc = "Code action" })
map("n", "<leader>d",  vim.diagnostic.open_float, { desc = "Error detail" })
