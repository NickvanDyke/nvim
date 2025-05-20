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
        local is_modified = vim.bo[props.buf].modified
        local normal_hl = vim.api.nvim_get_hl(0, { name = 'Normal' })

        return {
          { '', guifg = ft_color or '#44406e', guibg = normal_hl.bg },
          { ft_icon, ' ', guibg = ft_color or '#44406e', guifg = helpers.contrast_color(ft_color) },
          { ' ' .. filename .. ' ', gui = is_modified and 'bold,italic' or 'bold', guibg = '#44406e' },
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
