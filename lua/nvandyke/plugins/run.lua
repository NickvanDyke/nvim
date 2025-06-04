return {
  'diniamo/run.nvim',
  opts = {},
  keys = {
    {
      '<leader>r',
      function()
        require('run').run()
      end,
      desc = 'Run (cached)',
    },
    {
      '<leader>R',
      function()
        require('run').run(nil, true)
      end,
      desc = 'Run (and cache)',
    },
  },
}
