return {
  'folke/trouble.nvim',
  cmd = 'Trouble',
  keys = {
    {
      '<leader>cD',
      '<cmd>Trouble diagnostics toggle<cr>',
      desc = 'Diagnostics (Trouble)',
    },
    {
      '<leader>cd',
      '<cmd>Trouble diagnostics toggle filter.buf=0<cr>',
      desc = 'Buffer Diagnostics (Trouble)',
    },
    {
      '<leader>cs',
      '<cmd>Trouble symbols toggle focus=false<cr>',
      desc = '[S]ymbols (Trouble)',
    },
    {
      '<leader>cl',
      '<cmd>Trouble lsp toggle focus=false win.position=right<cr>',
      desc = 'LSP Definitions / references / ... (Trouble)',
    },
    {
      '<leader>cL',
      '<cmd>Trouble loclist toggle<cr>',
      desc = '[L]ocation List (Trouble)',
    },
    {
      '<leader>cq',
      '<cmd>Trouble qflist toggle<cr>',
      desc = '[Q]uickfix List (Trouble)',
    },
  },
  opts = {
    warn_no_results = false,
    keys = {
      ['<c-x>'] = 'jump_split',
    },
  },
}
