return {
  'folke/which-key.nvim',
  event = 'VimEnter',
  opts = {
    preset = 'helix',
    -- TODO: Workaround till https://github.com/folke/which-key.nvim/issues/967
    show_help = false,
    spec = {
      { '<leader>o', group = 'Opencode', mode = { 'n', 'v' }, icon = '󱚣' },
      { '<leader>z', group = 'Zettelkasten', mode = { 'n', 'x' }, icon = '' },
      { '<leader>c', group = 'Code' },
      { '<leader>s', group = 'Search', mode = { 'n', 'v' } },
      { '<leader>g', group = 'Git', mode = { 'n', 'v' } },
      { '<leader>d', group = 'Debug', mode = { 'n', 'v' } },
      { '<leader>u', group = 'User' },
      { '<leader>l', group = 'Quickfix' },
      { '<leader>r', group = 'Refactoring', mode = { 'n', 'v' } },
      { '<leader>ri', group = 'Inline' },
      { '<leader>rd', group = 'Debug' },
      { '<leader>re', group = 'Extract' },
      { '<leader>b', group = 'Buffer' },
      { '<leader>u', group = 'User', icon = '' },
      { 'gr', group = 'LSP' },
      { 'gl', group = 'Log' },
      { 'gL', group = 'Log w/ operator' },
      { 'gp', group = 'LSP (preview)' },
    },
  },
}
