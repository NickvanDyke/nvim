return {
  'Wansmer/treesj',
  keys = {
    {
      'gS',
      '<cmd>lua require("treesj").toggle()<CR>',
      noremap = true,
      silent = true,
      mode = 'n',
    },
  },
  dependencies = { 'nvim-treesitter/nvim-treesitter' }, -- if you install parsers with `nvim-treesitter`
  opts = {
    use_default_keymaps = false,
  }
}
