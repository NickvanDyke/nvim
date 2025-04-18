return {
  'nvim-focus/focus.nvim',
  event = 'WinNew',
  opts = {
    ui = {
      -- Kinda disorienting to have this constantly flicker.
      -- Doesn't play well with floating windows either.
      signcolumn = false,

      -- it doesn't properly re-enable cursorline when returning from a floating window
      cursorline = false,
    },
  },
  keys = {
    {
      '<c-w>f',
      function()
        require('focus').split_nicely()
      end,
      desc = 'Split nicely',
    },
  },
}
