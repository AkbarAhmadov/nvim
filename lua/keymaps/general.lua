local map = vim.keymap.set

map("n", "<leader>w", ":silent w<CR>",   { silent = true, desc = "Save" })
map("n", "<leader>q", ":q!<CR>",         { silent = true, desc = "Close" })
map("n", "<leader>Q", ":qa!<CR>",        { silent = true, desc = "Close all" })

map("n", "<C-e>", ":Neotree toggle<CR>", { silent = true, desc = "Gezgin aç/kapat" })

map("n", "<C-h>", "<C-w>h")
map("n", "<C-l>", "<C-w>l")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")

map("n", "<Tab>",     ":bnext<CR>",    { silent = true })
map("n", "<S-Tab>",   ":bprev<CR>",    { silent = true })
map("n", "<leader>h", ":bdelete<CR>",  { silent = true, desc = "Buffer kapat" })

map("n", "r", "<C-r>", { desc = "Redo" })

map("n", "<C-M-n>", function()
  vim.cmd("write")
  local filepath = vim.fn.expand("%:p")
  local binary   = vim.fn.expand("%:t:r")
  local cmd = string.format(
    'g++ -std=c++17 -Wall -O2 %q -o %q 2>&1 && echo "Compiled, Running" && echo "==================================" && ./%s || echo "Compilation error"',
    filepath, binary, binary
  )
  vim.cmd("botright vsplit")
  vim.cmd("terminal bash -lc " .. vim.fn.shellescape(cmd))
end, { desc = "Compile & Run" })

-- Debugger: Ctrl+Alt+D
-- Compile: g++ -std=c++17 -O0 -g -fsanitize=address,undefined -fno-omit-frame-pointer <file> -o <binary>
-- Run:     gdb --args ./<binary>
map("n", "<C-M-d>", function()
  vim.cmd("write")
  local filepath = vim.fn.expand("%:p")
  local binary   = vim.fn.expand("%:t:r")
  local cmd = string.format(
    'g++ -std=c++17 -O0 -g -fsanitize=address,undefined -fno-omit-frame-pointer %q -o %q 2>&1 && echo "Compiled, Starting GDB..." && echo "==================================" && gdb --args ./%s || echo "Compilation error"',
    filepath, binary, binary
  )
  vim.cmd("botright vsplit")
  vim.cmd("terminal bash -lc " .. vim.fn.shellescape(cmd))
end, { desc = "Compile & Debug (GDB)" })

map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move the line down" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move the line up" })
map("n", "<C-a>", "ggVG",          { desc = "Select all" })
map("v", "<C-c>", '"+y',           { desc = "Copy" })
map("v", "<C-x>", '"+d',           { desc = "Cut" })

map("n", "<A-Up>",   ":m .-2<CR>==", { silent = true, desc = "Move the line up" })
map("n", "<A-Down>", ":m .+1<CR>==", { silent = true, desc = "Move the line down" })

map("n", "<leader>k", ":WhichKey<CR>", { silent = true, desc = "Show keyboard shortcuts." })

map("n", "<leader>t", ":botright vsplit | terminal<CR>", { silent = true, desc = "Terminal aç" })
