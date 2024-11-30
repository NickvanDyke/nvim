return {
  'rachartier/tiny-inline-diagnostic.nvim',
  priority = 1000, -- needs to be loaded in first
  config = function()
    vim.diagnostic.config {
      virtual_text = false, -- we use tiny-inline-diagnostic
      severity_sort = true,
      underline = true,
      float = {
        source = true,
        border = 'rounded',
      },
    }

    require('tiny-inline-diagnostic').setup {
      options = {
        -- multilines = true,
        show_source = true,
        -- show_all_diags_on_cursorline = true,
      },
    }
  end,
}
