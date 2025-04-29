return {
  'Chaitanyabsprip/fastaction.nvim',
  opts = {},
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
