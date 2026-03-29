return {
  {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "LspAttach",
    config = function()
      require("tiny-inline-diagnostic").setup({
        signs = {
          left        = "",
          right       = "",
          diag        = "●",
          arrow       = "    ",
          up_arrow    = "    ",
          vertical    = " │",
          vertical_end= " └",
        },
        hi = {
          error        = "DiagnosticError",
          warn         = "DiagnosticWarn",
          info         = "DiagnosticInfo",
          hint         = "DiagnosticHint",
          arrow        = "NonText",
          background   = "CursorLine",
          mixing_color = "None",
        },
        blend = {
          factor = 0.15,
        },
        options = {
          show_source                  = false,
          throttle                     = 20,
          softwrap                     = 15,
          multiple_diag_under_cursor   = true,
          multilines                   = true,
          show_all_diags_on_cursorline = true,
          use_icons_from_diagnostic    = true,
        },
      })
    end,
  },
}
