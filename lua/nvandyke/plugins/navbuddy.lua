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
      border = 'rounded',
      size = { width = '69%', height = 11 },
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
  config = function(_, opts)
    -- FIX:
    vim.api.nvim_create_autocmd('FileType', {
      pattern = 'Navbuddy',
      command = 'setlocal nowrap',
    })

    require('nvim-navbuddy').setup(opts)
  end,
}
