return {
  'folke/snacks.nvim',
  opts = {
    terminal = {
      enabled = true,
      win = {
        wo = {
          winbar = '',
        },
        border = vim.o.winborder,
      },
    },
  },
  keys = {
    {
      '<C-t>',
      function()
        Snacks.terminal.toggle(nil, {
          win = {
            -- position = 'float',
            -- backdrop = false,
          },
        })
      end,
      desc = 'Toggle newest terminal',
      mode = { 'n', 't' },
    },
    {
      '<S-C-t>',
      function()
        Snacks.terminal.open()
      end,
      desc = 'Open new terminal',
      mode = { 'n', 't' },
    },
  },
}
