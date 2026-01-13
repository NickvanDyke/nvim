return {
  'nvim-mini/mini.files',
  enabled = false,
  opts = {},
  keys = {
    {
      '\\',
      function()
        require('mini.files').open(vim.api.nvim_buf_get_name(0))
      end,
      desc = 'Open Mini Files',
    },
  },
}
