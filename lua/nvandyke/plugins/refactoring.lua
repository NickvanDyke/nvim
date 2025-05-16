return {
  'ThePrimeagen/refactoring.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
  },
  keys = {
    {
      mode = { 'n', 'x' },
      '<leader>R',
      function()
        require('refactoring').select_refactor {}
      end,
      desc = 'Refactor',
    },
  },
}
