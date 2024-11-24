return {
  'tzachar/highlight-undo.nvim',
  event = 'VeryLazy',
  config = function()
    -- https://github.com/tzachar/highlight-undo.nvim/issues/28
    require('highlight-undo').setup {
      duration = 300,
      keymaps = {
        undo = {
          desc = 'undo',
          hlgroup = 'HighlightUndo',
          mode = 'n',
          lhs = 'u',
          rhs = nil,
          opts = {},
        },
        redo = {
          desc = 'redo',
          hlgroup = 'HighlightUndo',
          mode = 'n',
          lhs = '<C-r>',
          rhs = nil,
          opts = {},
        },
      },
    }
  end,
}
