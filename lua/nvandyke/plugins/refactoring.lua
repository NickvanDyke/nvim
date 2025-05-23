return {
  'ThePrimeagen/refactoring.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
  },
  keys = {
    {
      mode = { 'n', 'x' },
      '<leader>ri',
      function()
        require('refactoring').refactor 'Inline Variable'
      end,
      desc = 'Inline Variable',
    },
    -- TODO: Try refactoring.debug
  },
}
