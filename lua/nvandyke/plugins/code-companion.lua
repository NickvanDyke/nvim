return {
  'olimorris/codecompanion.nvim',
  -- enabled = false,
  event = 'VeryLazy',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
    'echasnovski/mini.diff',
  },
  opts = {
    display = {
      diff = {
        provider = 'mini_diff',
      },
    },
  },
  keys = {
    {
      '<c-a>',
      '<cmd>CodeCompanionActions<cr>',
      mode = { 'n', 'v' },
      noremap = true,
      silent = true,
    },
    {
      '<leader>c',
      '<cmd>CodeCompanionChat Toggle<cr>',
      mode = { 'n', 'v' },
      noremap = true,
      silent = true,
    },
    {
      'ga',
      '<cmd>CodeCompanionChat Add<cr>',
      mode = { 'v' },
      noremap = true,
      silent = true,
    },
  },
  init = function()
    vim.cmd [[cab cc CodeCompanion]]
  end,
}
