return {
  'folke/snacks.nvim',
  opts = {
    explorer = {},
    picker = {
      sources = {
        explorer = {
          hidden = true,
          ignored = true,
        },
      },
    },
  },
  keys = {
    {
      '\\',
      function()
        Snacks.explorer.open()
      end,
      desc = 'Snacks Explorer',
    },
  },
}
