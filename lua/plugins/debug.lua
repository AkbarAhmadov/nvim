return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")

      vim.opt.signcolumn = "yes"

      vim.api.nvim_set_hl(0, "DapBreakpoint", { fg = "#FF0000" })
      vim.api.nvim_set_hl(0, "DapBreakpointCondition", { fg = "#ff9e00" })
      vim.api.nvim_set_hl(0, "DapBreakpointRejected", { fg = "#5c6370" })
      vim.api.nvim_set_hl(0, "DapStopped", { fg = "#00ff87" })

      vim.fn.sign_define("DapBreakpoint", { text = "●", texthl = "DapBreakpoint", linehl = "", numhl = "" })
      vim.fn.sign_define("DapBreakpointCondition", { text = "◆", texthl = "DapBreakpointCondition", linehl = "", numhl = "" })
      vim.fn.sign_define("DapBreakpointRejected", { text = "●", texthl = "DapBreakpointRejected", linehl = "", numhl = "" })
      vim.fn.sign_define("DapStopped", { text = "▶", texthl = "DapStopped", linehl = "DapStopped", numhl = "" })

      dap.adapters.gdb = {
        type = "executable",
        command = "gdb",
        args = { "-i", "dap" },
      }


      dap.configurations.cpp = {
        {
          name = "Debug (CP - input.txt)",
          type = "gdb",
          request = "launch",
          program = function()
            vim.cmd("write")
            local filedir = vim.fn.expand("%:p:h")
            local filename = vim.fn.expand("%:t:r")
            local binary = filedir .. "/" .. filename
            
            local compile_cmd = string.format("g++ -g '%s/%s.cpp' -o '%s'", filedir, filename, binary)
            os.execute(compile_cmd)
            
            return binary
          end,
          cwd = "${fileDirname}",
          stopAtBeginningOfMainSubprogram = false,
          stdio = {
            function()
              return vim.fn.expand("%:p:h") .. "/input.txt"
            end,
            nil,
            nil,
          },
        },
      }

      dapui.setup({
        layouts = {
          {
            elements = {
              { id = "scopes",      size = 0.4 },
              { id = "breakpoints", size = 0.2 },
              { id = "stacks",      size = 0.2 },
              { id = "watches",     size = 0.2 },
            },
            size = 0.3,
            position = "left",
          },
          {
            elements = {
              { id = "repl",    size = 0.5 },
              { id = "console", size = 0.5 },
            },
            size = 0.25,
            position = "bottom",
          },
        },
      })

      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end,
  },
}
