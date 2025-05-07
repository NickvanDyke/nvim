return {
  'nvim-treesitter/nvim-treesitter-context',
  enabled = true,
  event = 'BufReadPost',
  opts = {
    multiwindow = true,
    line_numbers = false,
    multiline_threshold = 7,
    mode = 'cursor',
    -- separator = '.',
  },
  keys = {
    {
      '[c',
      function()
        require('treesitter-context').go_to_context()
      end,
    },
  },
}
