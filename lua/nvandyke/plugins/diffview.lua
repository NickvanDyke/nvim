return {
  'sindrets/diffview.nvim',
  opts = {},
  keys = {
    {
      '<leader>gd',
      function()
        require('diffview').open()
      end,
      desc = 'Open Diffview',
    },
    {
      '<leader>gD',
      function()
        require('diffview').close()
      end,
      desc = 'Close Diffview',
    },
    -- {
    --   '<leader>gf',
    --   function()
    --     require('diffview').file_history(vim.fn.expand '<cfile>')
    --   end,
    -- },
  },
  init = function()
    vim.cmd [[cab gd Diffview]]
  end,
}
