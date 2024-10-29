return {
  'Exafunction/codeium.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  config = function()
    require('codeium').setup {
      enable_cmp_source = false,
      virtual_text = {
        enabled = true,
      },
    }

    vim.keymap.set('n', '<leader>cc', '<cmd>Codeium Chat<CR>', { desc = '[C]odeium [C]hat' })
  end,
}
