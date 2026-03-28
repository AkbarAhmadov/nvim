vim.api.nvim_create_user_command("Add", function()
  vim.cmd("CompetiTest add_testcase")
end, { desc = "Add test case" })

vim.api.nvim_create_user_command("Run", function()
  vim.cmd("CompetiTest run")
end, { desc = "Run test cases" })

vim.api.nvim_create_user_command("Edit", function()
  vim.cmd("CompetiTest edit_testcase")
end, { desc = "Edit test case" })

vim.api.nvim_create_user_command("Del", function()
  vim.cmd("CompetiTest delete_testcase")
end, { desc = "Delete test case" })
