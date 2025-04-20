return {
  'folke/snacks.nvim',
  opts = {
    terminal = {
      enabled = true,
      win = {
        wo = {
          winbar = '',
        },
        border = vim.o.winborder
      },
    },
  },
  keys = {
    {
      '<C-`>',
      function()
        Snacks.terminal.toggle()
      end,
      desc = 'Toggle newest terminal',
      mode = { 'n', 't' },
    },
    {
      '<S-C-`>',
      function()
        Snacks.terminal.open()
      end,
      desc = 'Open new terminal',
      mode = { 'n', 't' },
    },
  },
}
