return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    local lualine = require('lualine')

    lualine.setup {
      sections = {
        lualine_c = {
          {
            'filename',
            path = 1,
          },
        },
        lualine_x = { 'filetype' },
      },
      winbar = {},
      inactive_winbar = {},
    }
  end,
}
