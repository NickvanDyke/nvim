return {
  'folke/snacks.nvim',
  opts = {
    terminal = {
      enabled = true,
      win = {
        wo = {
          winbar = '',
        },
      },
    },
  },
  keys = {
    {
      '<C-`>',
      function()
        Snacks.terminal()
      end,
      desc = 'Toggle Terminal',
      mode = { 'n', 't' },
    },
  },
}
