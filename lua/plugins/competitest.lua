return {
  {
    "xeluxee/competitest.nvim",
    dependencies = { "MunifTanjim/nui.nvim" },
    config = function()
      vim.api.nvim_set_hl(0, "CompetiTestCorrect",         { fg = "#00ff87", bold = true })
      vim.api.nvim_set_hl(0, "CompetiTestWrong",           { fg = "#ff007c", bold = true })
      vim.api.nvim_set_hl(0, "CompetiTestRunning",         { fg = "#ffff00", bold = true })
      vim.api.nvim_set_hl(0, "CompetiTestWarning",         { fg = "#ff9e00", bold = true })
      vim.api.nvim_set_hl(0, "CompetiTestSkipped",         { fg = "#00b4d8", bold = true })
      vim.api.nvim_set_hl(0, "CompetiTestCompiling",       { fg = "#bf00ff", bold = true })
      vim.api.nvim_set_hl(0, "CompetiTestCorrectSolution", { fg = "#00ff87", bg = "NONE", bold = true })
      vim.api.nvim_set_hl(0, "CompetiTestWrongSolution",   { fg = "#ff007c", bg = "NONE", bold = true })

      vim.api.nvim_set_hl(0, "DiffAdd",    { fg = "#00ff87", bg = "#1a2f1a" })
      vim.api.nvim_set_hl(0, "DiffDelete", { fg = "#ff007c", bg = "#2f1a1a" })
      vim.api.nvim_set_hl(0, "DiffChange", { fg = "#ffff00", bg = "#2f2f1a" })
      vim.api.nvim_set_hl(0, "DiffText",   { fg = "#ffffff", bg = "#3f3f1a" })

      require("competitest").setup({
        runner_ui = {
          interface = "popup",
          selector_show_nu = true,
          show_nu = true,
        },
        popup_ui = {
          total_width  = 0.85,
          total_height = 0.85,
          layout = {
            { 4, "tc" },
            { 5, { { 1, "so" }, { 1, "eo" } } },
            { 5, { { 1, "si" }, { 1, "se" } } },
          },
        },
        floating_border = "rounded",
        floating_border_highlight = "FloatBorder",
        save_current_file = true,
        testcases_directory = ".testcases",
        compile_command = {
          cpp = { exec = "g++", args = { "-std=c++17", "-O2", "-Wall", "-I/home/ekber/cpp_libs", "-DCOMP_TEST", "$(FNAME)", "-o", "$(FNOEXT)" } },
        },
        run_command = {
          cpp = { exec = "./$(FNOEXT)" },
        },
        multiple_testing      = -1,
        maximum_time          = 5000,
        output_compare_method = "squish",
        view_output_diff      = true,
        testcases_use_single_file = false,
      })
    end,
  },
}
