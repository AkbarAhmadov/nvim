vim.opt.number         = true
vim.opt.relativenumber = false
vim.opt.tabstop        = 4
vim.opt.shiftwidth     = 4
vim.opt.expandtab      = true
vim.opt.smartindent    = true
vim.opt.termguicolors  = true
vim.opt.cursorline     = true
vim.opt.clipboard      = "unnamedplus"
vim.opt.scrolloff      = 8
vim.opt.wrap           = false
vim.opt.hlsearch       = false
vim.opt.incsearch      = true
vim.opt.updatetime     = 200
vim.opt.signcolumn     = "yes"
vim.opt.mouse          = "a"
vim.api.nvim_create_autocmd({ "TextChanged", "InsertLeave" }, {
  pattern = "*",
  command = "silent! write",
})
vim.opt.virtualedit = "onemore"
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
  vim.lsp.handlers.hover, { border = "rounded" }
)
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
  vim.lsp.handlers.signature_help, { border = "rounded" }
)
vim.diagnostic.config({
  float = { border = "rounded" },
})
vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#7aa2f7", bold = true })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })

vim.api.nvim_set_hl(0, "CompetiTestBorder", { fg = "#7aa2f7", bold = true })
