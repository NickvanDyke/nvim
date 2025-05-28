return {
  'ThePrimeagen/refactoring.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
  },
  keys = {
    {
      mode = { 'n', 'x' },
      '<leader>r',
      function()
        require('refactoring').select_refactor()
      end,
      desc = 'Inline Variable',
    },
    -- TODO: Try refactoring.debug instead of timber
  },
}
