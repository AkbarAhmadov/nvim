local map = vim.keymap.set

map("n", "<F5>",  function() require("dap").continue() end,          { desc = "Debug start/continue" })
map("n", "<F10>", function() require("dap").step_over() end,         { desc = "Step over" })
map("n", "<F11>", function() require("dap").step_into() end,         { desc = "Step into" })
map("n", "<F12>", function() require("dap").step_out() end,          { desc = "Step out" })
map("n", "<F9>",  function() require("dap").toggle_breakpoint() end, { desc = "Toggle breakpoint" })
map("n", "<F8>",  function() require("dap").terminate() end,         { desc = "Stop debug" })
