return {
  'folke/which-key.nvim',
  event = 'VimEnter',
  opts = {
    preset = 'helix',
    -- TODO: Workaround till https://github.com/folke/which-key.nvim/issues/967
    show_help = false,
    icons = {
      keys = {},
    },
    spec = {
      { '<leader>z', group = 'Zettelkasten', mode = { 'n', 'x' } },
      { '<leader>c', group = 'Code' },
      { '<leader>s', group = 'Search' },
      { '<leader>l', group = 'Lazy' },
      { '<leader>t', group = 'Toggle' },
      { '<leader>g', group = 'Git', mode = { 'n', 'v' } },
      { '<leader>d', group = 'Debug', mode = { 'n', 'v' } },
      { '<leader>u', group = 'User' },
      { '<leader>q', group = 'Quickfix' },
      { '<leader>t', group = 'Terminal' },
      { '<leader>o', group = 'Opencode' },
      { '<leader>r', group = 'Refactoring' },
      { '<leader>ri', group = 'Inline' },
      { '<leader>rd', group = 'Debug' },
      { '<leader>re', group = 'Extract' },
      { '<leader>b', group = 'Buffer' },
      { 'gr', group = 'LSP' },
      { 'gl', group = 'Log' },
      { 'gL', group = 'Log w/ operator' },
      { 'gp', group = 'LSP (preview)' },
    },
  },
}
