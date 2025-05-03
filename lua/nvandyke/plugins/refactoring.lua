return {
  'ThePrimeagen/refactoring.nvim',
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
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
  },
}
