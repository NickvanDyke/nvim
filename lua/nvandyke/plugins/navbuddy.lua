return {
  'SmiteshP/nvim-navbuddy',
  dependencies = {
    'neovim/nvim-lspconfig',
    'SmiteshP/nvim-navic',
    'MunifTanjim/nui.nvim',
  },
  opts = {
    lsp = {
      auto_attach = true,
    },
    window = {
      border = vim.g.border_default,
      size = '69%',
    },
  },
  keys = {
    {
      '<leader>o',
      '<cmd>lua require("nvim-navbuddy").open()<CR>',
      desc = 'Navbuddy',
      mode = 'n',
    },
  },
}
