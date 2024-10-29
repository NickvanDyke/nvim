return {
  'gen740/SmoothCursor.nvim',
  config = function()
    require('smoothcursor').setup {
      cursor = '',
      -- linehl = 'CursorLine',
      speed = 17,
    }
  end,
}
