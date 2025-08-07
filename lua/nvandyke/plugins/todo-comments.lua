return {
  'folke/todo-comments.nvim',
  event = 'VeryLazy',
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
    {
      '<leader>st',
      function()
        Snacks.picker.todo_comments()
      end,
      desc = 'Todo',
    },
  },
  opts = {
    -- signs = false,
  },
  config = function(_, opts)
    require('todo-comments').setup(opts)

    -- FIX: Still doesn't redraw after undo...
    -- https://github.com/folke/todo-comments.nvim/issues/61
    -- vim.api.nvim_create_autocmd('FileChangedShellPost', {
    --   desc = 'Fix highlight desync issues',
    --   callback = function(args)
    --     require('todo-comments.highlight').redraw(args.buf, 0, vim.api.nvim_buf_line_count(args.buf))
    --   end,
    -- })
  end,
}
