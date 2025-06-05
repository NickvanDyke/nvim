return {
  'echasnovski/mini.diff',
  version = '*',
  event = 'BufReadPost',
  opts = {},
  keys = {
    {
      '<leader>go',
      function()
        require('mini.diff').toggle_overlay(0)
      end,
    }
  }
}
