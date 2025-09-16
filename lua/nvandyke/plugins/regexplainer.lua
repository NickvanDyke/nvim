return {
  'bennypowers/nvim-regexplainer',
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    -- 'MunifTanjim/nui.nvim',
  },
  opts = {
    -- auto = true,
  },
  keys = {
    { 'gR', desc = 'Explain Regex' },
  },
}
