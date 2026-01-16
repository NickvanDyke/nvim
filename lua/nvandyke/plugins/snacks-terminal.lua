-- FIX: `OA` on up arrow press,
-- and ignoring first keypress after normal -> terminal mode
return {
  'folke/snacks.nvim',
  opts = {
    terminal = {
      enabled = true,
      -- auto_insert = false,
      win = {
        wo = {
          winbar = '',
          -- winhighlight = 'Normal:Normal',
        },
        border = vim.o.winborder,
      },
    },
  },
  keys = {
    {
      '<c-\\>',
      function()
        Snacks.terminal.toggle()
      end,
      desc = 'Toggle terminal',
      mode = { 'n', 't' },
    },
    -- {
    --   '<leader>tf',
    --   function()
    --     Snacks.terminal.toggle(nil, {
    --       env = {
    --         -- So Snacks IDs it differently
    --         floating = 'true',
    --       },
    --       win = {
    --         position = 'float',
    --       },
    --     })
    --   end,
    --   desc = 'Toggle floating terminal',
    --   mode = 'n',
    -- },
    {
      '<s-c-\\>',
      function()
        Snacks.terminal.open()
      end,
      desc = 'Open new terminal',
      mode = 'n',
    },
  },
}
