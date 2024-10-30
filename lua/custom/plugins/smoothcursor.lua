return {
  'gen740/SmoothCursor.nvim',
  config = function()
    require('smoothcursor').setup {
      cursor = '',
      speed = 17,
      disable_float_win = true, -- looks bad in Arrow
    }

    function sync_cursor_to_mini_mode()
      local mode, mode_hl = require('mini.statusline').section_mode {}
      local hl = vim.api.nvim_get_hl_by_name(mode_hl, true)

      local background = hl.background and string.format('#%06x', hl.background) or nil

      vim.api.nvim_set_hl(0, 'SmoothCursor', { fg = background })
    end

    sync_cursor_to_mini_mode()

    -- Sync cursor color with mini.statusline mode colors
    vim.api.nvim_create_autocmd({ 'ModeChanged' }, {
      callback = sync_cursor_to_mini_mode,
    })
  end,
}
