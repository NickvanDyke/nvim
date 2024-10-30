return {
  'gen740/SmoothCursor.nvim',
  config = function()
---@diagnostic disable-next-line: missing-fields
    require('smoothcursor').setup {
      cursor = '',
      speed = 17,
      disable_float_win = true, -- looks bad in Arrow
    }

    local mode_to_hl_name = {
      ['n'] = 'lualine_a_normal',
      ['i'] = 'lualine_a_insert',
      ['v'] = 'lualine_a_visual',
      ['V'] = 'lualine_a_visual',
      ['R'] = 'lualine_a_replace',
      ['c'] = 'lualine_a_command',
      ['t'] = 'lualine_a_terminal',
    }

    local function sync_cursor_to_mini_mode()
      local mode = vim.fn.mode()
      local hl_name = mode_to_hl_name[mode] or 'lualine_a_normal'
      local hl_group = vim.api.nvim_get_hl_by_name(hl_name, true)

      local background = hl_group.background and string.format('#%06x', hl_group.background) or nil

      vim.api.nvim_set_hl(0, 'SmoothCursor', { fg = background })
    end

    sync_cursor_to_mini_mode()

    -- Sync cursor color with mini.statusline mode colors
    vim.api.nvim_create_autocmd({ 'ModeChanged' }, {
      callback = sync_cursor_to_mini_mode,
    })
  end,
}
