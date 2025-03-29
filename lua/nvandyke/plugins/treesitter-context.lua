return {
  'nvim-treesitter/nvim-treesitter-context',
  event = 'BufReadPost',
  opts = { multiline_threshold = 4, mode = 'cursor' },
}
