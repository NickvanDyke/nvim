return {
  'folke/snacks.nvim',
  opts = {
    terminal = {
      enabled = true,
      auto_insert = false,
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
      '<leader>tt',
      function()
        Snacks.terminal.toggle()
      end,
      desc = 'Toggle terminal',
      mode = 'n',
    },
    {
      '<leader>tf',
      function()
        Snacks.terminal.toggle(nil, {
          env = {
            -- So Snacks IDs it differently
            floating = 'true',
          },
          win = {
            position = 'float',
          },
        })
      end,
      desc = 'Toggle floating terminal',
      mode = 'n',
    },
    {
      '<leader>tn',
      function()
        Snacks.terminal.open()
      end,
      desc = 'Open new terminal',
      mode = 'n',
    },
  },
}
