return {
  'nvim-focus/focus.nvim',
  event = 'WinNew',
  opts = {
    ui = {
      -- Kinda disorienting to have this constantly flicker.
      -- Doesn't play well with floating windows either.
      signcolumn = false,
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
