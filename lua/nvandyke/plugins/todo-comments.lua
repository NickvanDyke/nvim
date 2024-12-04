return {
  'folke/todo-comments.nvim',
  event = 'BufReadPost',
  dependencies = { 'nvim-lua/plenary.nvim' },
  keys = {
    {
      ']t',
      function()
        require('todo-comments').jump_next()
      end,
      mode = 'n',
      desc = 'Next todo comment',
    },
    {
      '[t',
      function()
        require('todo-comments').jump_prev()
      end,
      mode = 'n',
      desc = 'Previous todo comment',
    },
    { '<leader>st', '<cmd>TodoTelescope<cr>', mode = 'n', desc = '[s]earch [t]odos' },
  },
  opts = {
    signs = false,
  },
}
