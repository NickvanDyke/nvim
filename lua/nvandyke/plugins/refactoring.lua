return {
  'ThePrimeagen/refactoring.nvim',
  keys = {
    {
      mode = { 'n', 'x' },
      '<leader>cR',
      function()
        require('refactoring').select_refactor {}
      end,
      { desc = '[R]efactor' },
    },
    {
      mode = 'n',
      '<leader>dp',
      function()
        require('refactoring').debug.printf { below = false }
      end,
      { desc = '[D]ebug [P]rint' },
    },
    {
      mode = { 'x', 'n' },
      '<leader>dv',
      function()
        require('refactoring').debug.print_var {}
      end,
      { desc = '[D]ebug print [V]ar' },
    },
    {
      mode = 'n',
      '<leader>dc',
      function()
        require('refactoring').debug.cleanup {}
      end,
      { desc = '[D]ebug print [C]leanup' },
    },
  },
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
  },
}
