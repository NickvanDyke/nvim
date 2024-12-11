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

    local function get_colors_from_hl(hl_name)
      local hl_group = vim.api.nvim_get_hl_by_name(hl_name, true)
      local background = hl_group.background and string.format('#%06x', hl_group.background) or nil
      local foreground = hl_group.foreground and string.format('#%06x', hl_group.foreground) or nil
      return { bg = background, fg = foreground }
    end

    local function sync_cursor_to_mode()
      local mode = vim.fn.mode()
      local mode_hl = mode_to_hl_name[mode] or 'lualine_a_normal'

      local mode_color = get_colors_from_hl(mode_hl).bg
      local cursorline_bg = get_colors_from_hl('CursorLineNr').bg

      vim.api.nvim_set_hl(0, 'SmoothCursor', {
        fg = mode_color,
        bg = cursorline_bg,
      })
      -- Render hl changes immediately. Hopefully not bad for perf lol
      vim.api.nvim_command('redraw')
    end

    sync_cursor_to_mode()

    -- Sync cursor color with mini.statusline mode colors
    vim.api.nvim_create_autocmd( 'ModeChanged' , {
      -- TODO: doesn't seem to trigger immediately for some mode changes.
      -- Lualine sometimes does and sometimes doesn't.
      callback = sync_cursor_to_mode,
    })
  end,
}
