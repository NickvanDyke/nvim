return {
  'b0o/incline.nvim',
  event = 'VeryLazy',
  config = function()
    local helpers = require 'incline.helpers'
    local devicons = require 'nvim-web-devicons'
    require('incline').setup {
      window = {
        padding = 0,
        margin = { horizontal = 0 },
      },
      hide = {
        -- only_win = true,
      },
      render = function(props)
        local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ':t') or '[No Name]'
        local ft_icon, ft_color = devicons.get_icon_color(filename)
        local modified = vim.bo[props.buf].modified

        return {
          { '', guifg = ft_color or '#44406e' },
          { ft_icon, ' ', guibg = ft_color, guifg = helpers.contrast_color(ft_color) },
          { ' ' .. filename .. ' ', gui = modified and 'bold,italic' or 'bold', guibg = '#44406e' },
        }
      end,
    }

    -- FIX: Doesn't work
    vim.api.nvim_create_autocmd('ColorScheme', {
      callback = function()
        vim.schedule(require('incline').refresh)
      end,
    })
  end,
}
