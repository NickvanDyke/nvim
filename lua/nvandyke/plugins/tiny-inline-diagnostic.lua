return {
  'rachartier/tiny-inline-diagnostic.nvim',
  event = 'BufReadPost',
  config = function()
    vim.diagnostic.config {
      virtual_text = false, -- prevent duplicates
      severity_sort = true,
      underline = true,
      float = {
        source = true,
        border = vim.g.border_default,
      },
    }

    require('tiny-inline-diagnostic').setup {
      preset = 'modern',
      options = {
        -- multilines = true,
        show_source = true,
        -- show_all_diags_on_cursorline = true,
      },
    }
  end,
}
