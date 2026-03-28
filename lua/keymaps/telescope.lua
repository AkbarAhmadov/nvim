local map = vim.keymap.set

map("n", "<leader>ff", ":Telescope find_files<CR>", { desc = "Search document" })
map("n", "<leader>fg", ":Telescope live_grep<CR>",  { desc = "Search contents" })
map("n", "<leader>fr", ":Telescope oldfiles<CR>",   { desc = "Last documents" })
