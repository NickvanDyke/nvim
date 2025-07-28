return {
  'Chaitanyabsprip/fastaction.nvim',
  enabled = false,
  opts = {
    dismiss_keys = { 'q', '<Esc>', '<C-c>' },
  },
  keys = {
    {
      'gra',
      function()
        require('fastaction').code_action()
      end,
      mode = { 'n', 'x' },
      desc = 'Code Action',
    },
  },
}
