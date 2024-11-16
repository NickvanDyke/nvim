return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    local lualine = require 'lualine'
    -- local trouble = require 'trouble'
    -- local symbols = trouble.statusline {
    --   mode = 'lsp_document_symbols',
    --   groups = {},
    --   title = false,
    --   filter = { range = true },
    --   format = '{kind_icon}{symbol.name:Normal}',
    --   -- The following line is needed to fix the background color
    --   -- Set it to the lualine section you want to use
    --   hl_group = 'lualine_c_normal',
    -- }

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
            -- fmt = function(str)
            --   return string.gsub(str, '/', ' > ')
            -- end,
          },
          -- {
          --   symbols.get,
          --   cond = symbols.has
          -- }
        },
        lualine_x = { 'filetype' },
      },
      winbar = {},
      inactive_winbar = {},
    }
  end,
}
