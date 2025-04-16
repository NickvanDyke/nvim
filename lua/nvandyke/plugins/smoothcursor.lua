return {
  'gen740/SmoothCursor.nvim',
  event = 'BufReadPre',
  dependencies = {
    'nvim-lualine/lualine.nvim',
  },
  config = function()
    ---@diagnostic disable-next-line: missing-fields
    require('smoothcursor').setup {
      cursor = '',
      speed = 31,
      disable_float_win = true, -- looks bad in Arrow
    }

    local mode_to_hl_name = {
      ['n'] = 'lualine_a_normal',
      ['i'] = 'lualine_a_insert',
      ['v'] = 'lualine_a_visual',
      ['V'] = 'lualine_a_visual',
      ['^V'] = 'lualine_a_visual', -- TODO: doesn't get selected?
      ['R'] = 'lualine_a_replace',
      ['c'] = 'lualine_a_command',
      -- ['t'] = 'lualine_a_terminal',
    }

    local function sync_cursor_to_mode()
      local mode_hl = mode_to_hl_name[vim.fn.mode()] or 'lualine_a_normal'

      local mode_color = vim.api.nvim_get_hl(0, { name = mode_hl }).bg
      local cursorline_bg = vim.api.nvim_get_hl(0, { name = 'CursorLine' }).bg

      vim.api.nvim_set_hl(0, 'SmoothCursor', {
        fg = mode_color,
        bg = cursorline_bg,
      })
    end

    sync_cursor_to_mode()

    vim.api.nvim_create_autocmd({ 'ModeChanged', 'ColorScheme' }, {
      callback = sync_cursor_to_mode,
    })
  end,
}
