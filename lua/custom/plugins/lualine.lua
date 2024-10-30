return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    local lualine = require 'lualine'

    lualine.setup {
      options = {
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
      },
      sections = {
        lualine_c = {
          {
            'filename',
            path = 1,
            fmt = function(str)
              return string.gsub(str, '/', ' > ')
            end,
          },
        },
        lualine_x = { 'filetype' },
      },
      winbar = {},
      inactive_winbar = {},
    }
  end,
}
