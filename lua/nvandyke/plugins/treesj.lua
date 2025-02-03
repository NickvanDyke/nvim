return {
  'Wansmer/treesj',
  keys = {
    {
      'gS',
      '<cmd>lua require("treesj").toggle()<CR>',
      desc = 'Treesitter split/join',
      noremap = true,
      silent = true,
      mode = 'n',
    },
  },
  dependencies = { 'nvim-treesitter/nvim-treesitter' }, -- if you install parsers with `nvim-treesitter`
  opts = {
    use_default_keymaps = false,
  },
}
