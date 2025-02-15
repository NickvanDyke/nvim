return {
  'bassamsdata/namu.nvim',
  opts = {
    -- Enable the modules you want
    namu_symbols = {
      enable = true,
      options = {}, -- here you can configure namu
    },
    ui_select = { enable = false }, -- vim.ui.select() wrapper
  },
  keys = {
    {
      '<leader>ss',
      ":lua require('namu.namu_symbols').show()<CR>",
      mode = 'n',
      silent = true,
      desc = 'LSP Symbols',
    },
    {
      '<leader>th',
      ":lua require('namu.colorscheme').show()<CR>",
      mode = 'n',
      silent = true,
      desc = 'Colorscheme Picker',
    },
  },
}
