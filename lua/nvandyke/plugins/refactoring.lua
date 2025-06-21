return {
  'ThePrimeagen/refactoring.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
  },
  keys = {
    {
      '<leader>riv',
      function()
        return require('refactoring').refactor 'Inline Variable'
      end,
      mode = { 'n', 'x' },
      expr = true,
      desc = 'Inline Variable',
    },
    {
      '<leader>rif',
      function()
        return require('refactoring').refactor 'Inline Function'
      end,
      mode = { 'n', 'x' },
      expr = true,
      desc = 'Inline Function',
    },
    {
      '<leader>rev',
      function()
        return require('refactoring').refactor 'Extract Variable'
      end,
      mode = { 'n', 'x' },
      expr = true,
      desc = 'Extract Variable',
    },
    {
      '<leader>ref',
      function()
        return require('refactoring').refactor 'Extract Function'
      end,
      mode = { 'n', 'x' },
      expr = true,
      desc = 'Extract Function',
    },
    {
      '<leader>rpp',
      function()
        require('refactoring').debug.printf {}
      end,
      mode = { 'n' },
      desc = 'Print',
    },
    {
      '<leader>rpv',
      function()
        require('refactoring').debug.print_var {}
      end,
      mode = { 'n', 'x' },
      desc = 'Print Variable',
    },
    {
      '<leader>rpc',
      function()
        require('refactoring').debug.cleanup {}
      end,
      mode = { 'n' },
      desc = 'Cleanup Debug',
    },
  },
}
