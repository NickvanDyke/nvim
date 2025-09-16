return {
  'mistricky/codesnap.nvim',
  build = 'make build_generator',
  opts = {
    has_breadcrumbs = true,
    show_workspace = true,
    has_line_number = true,
    bg_padding = 32,
    code_font_family = 'JetBrainsMono Nerd Font Mono',
  },
  keys = {
    {
      '<leader>css',
      '<Esc><cmd>CodeSnap<cr>', -- https://github.com/mistricky/codesnap.nvim/issues/103#issuecomment-2155887498
      mode = 'x',
      desc = 'Screenshot',
    },
    {
      '<leader>csh',
      '<Esc><cmd>CodeSnapHighlight<cr>', -- https://github.com/mistricky/codesnap.nvim/issues/103#issuecomment-2155887498
      mode = 'x',
      desc = 'Screenshot + highlight',
    },
  },
}
