return {
  'Chaitanyabsprip/fastaction.nvim',
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
    },
  },
}
