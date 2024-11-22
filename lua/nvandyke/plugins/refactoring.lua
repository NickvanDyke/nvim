return {
  'ThePrimeagen/refactoring.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
  },
  lazy = false,
  config = function()
    require('refactoring').setup()
    -- prompt for a refactor to apply when the remap is triggered
    vim.keymap.set({ 'n', 'x' }, '<leader>cR', function()
      require('refactoring').select_refactor()
    end, { desc = '[R]efactor' })
    -- Note that not all refactor support both normal and visual mode
  end,
}
