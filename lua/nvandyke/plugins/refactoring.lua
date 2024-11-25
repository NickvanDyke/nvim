return {
  'ThePrimeagen/refactoring.nvim',
  event = 'BufRead',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
  },
  lazy = false,
  config = function()
    require('refactoring').setup({})
    -- prompt for a refactor to apply when the remap is triggered
    vim.keymap.set({ 'n', 'x' }, '<leader>cR', function()
      require('refactoring').select_refactor({})
    end, { desc = '[R]efactor' })
    -- Note that not all refactor support both normal and visual mode

    -- You can also use below = true here to to change the position of the printf
    -- statement (or set two remaps for either one). This remap must be made in normal mode.
    vim.keymap.set('n', '<leader>dp', function()
      require('refactoring').debug.printf { below = false }
    end, { desc = '[D]ebug [P]rint' })

    -- Print var
    vim.keymap.set({ 'x', 'n' }, '<leader>dv', function()
      require('refactoring').debug.print_var({})
    end, { desc = '[D]ebug print [V]ar' })
    -- Supports both visual and normal mode

    vim.keymap.set('n', '<leader>dc', function()
      require('refactoring').debug.cleanup {}
    end, { desc = '[D]ebug print [C]leanup' })
    -- Supports only normal mode
  end,
}
