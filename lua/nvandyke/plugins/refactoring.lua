return {
  'ThePrimeagen/refactoring.nvim',
  keys = {
    {
      mode = { 'n', 'x' },
      '<leader>cR',
      function()
        require('refactoring').select_refactor {}
      end,
      desc = '[R]efactor',
    },
    {
      mode = 'n',
      '<leader>dp',
      function()
        require('refactoring').debug.printf { below = false }
      end,
      desc = '[d]ebug [p]rint',
    },
    {
      mode = { 'x', 'n' },
      '<leader>dv',
      function()
        require('refactoring').debug.print_var {}
      end,
      desc = '[d]ebug print [v]ar',
    },
    {
      mode = 'n',
      '<leader>dc',
      function()
        require('refactoring').debug.cleanup {}
      end,
      desc = '[d]ebug print [c]leanup',
    },
  },
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
  },
}
