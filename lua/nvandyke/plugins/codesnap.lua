return {
  'mistricky/codesnap.nvim',
  build = 'make build_generator',
  cmd = 'CodeSnap',
  opts = {
    has_breadcrumbs = true,
    has_line_number = true,
    bg_padding = 0,
  },
  keys = {
    {
      '<leader>S',
      '<Esc><cmd>CodeSnap<cr>', -- https://github.com/mistricky/codesnap.nvim/issues/103#issuecomment-2155887498
      mode = 'x',
      desc = 'Screenshot code',
    },
  },
}
