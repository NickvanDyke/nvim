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

    -- Depending on colorscheme, CursorLine will 'merge' the sign column bg color and CursorLine.
    -- But in other colorschemes, they disagree.
    local cursorline_bg = vim.api.nvim_get_hl_by_name('CursorLineNr', true).background
    vim.api.nvim_set_hl(0, 'SmoothCursor', {
      bg = cursorline_bg,
    })

    local function sync_cursor_to_mode()
      local mode = vim.fn.mode()
      local mode_hl = mode_to_hl_name[mode] or 'lualine_a_normal'
      local mode_color = vim.api.nvim_get_hl_by_name(mode_hl, true).background

      vim.api.nvim_set_hl(0, 'SmoothCursor', {
        fg = mode_color,
      })
    end

    sync_cursor_to_mode()

    vim.api.nvim_create_autocmd({ 'ModeChanged', 'ColorScheme' }, {
      -- TODO: doesn't seem to trigger immediately for some mode changes.
      -- Lualine sometimes does and sometimes doesn't.
      callback = sync_cursor_to_mode,
    })
  end,
}
