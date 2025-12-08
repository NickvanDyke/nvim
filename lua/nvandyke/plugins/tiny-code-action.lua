return {
  'rachartier/tiny-code-action.nvim',
  event = 'LspAttach',
  dependencies = {
    { 'nvim-lua/plenary.nvim' },
    { 'folke/snacks.nvim' },
  },
  opts = {
    backend = 'delta',
    picker = 'snacks',
  },
}
