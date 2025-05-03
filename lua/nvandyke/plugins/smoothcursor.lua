return {
  'gen740/SmoothCursor.nvim',
  event = 'BufReadPost',
  dependencies = {
    'nvim-lualine/lualine.nvim',
  },
  config = function()
    ---@diagnostic disable-next-line: missing-fields
    require('smoothcursor').setup {
      cursor = '',
      speed = 31,
      -- Show over signs in the sign column.
      -- Consistent and then don't have to deal with also syncing CursorLineSign bg.
      priority = 100,
    }

    local function get_simple_mode()
      -- See `:h mode()`, there are a lot lol
      local modes = {
        ['n'] = 'normal',
        ['i'] = 'insert',
        ['v'] = 'visual',
        ['ctrl-v'] = 'visual', -- idk why this one doesn't match
        ['s'] = 'visual',
        ['r'] = 'replace',
        ['c'] = 'command',
        ['t'] = 'terminal',
      }

      local mode = nil
      for mode_char, simple_mode in pairs(modes) do
        if string.find(string.lower(vim.fn.mode()), string.lower(mode_char)) == 1 then
          mode = simple_mode
          break
        end
      end

      return mode
    end

    local function sync_cursor_sign()
      local mode = get_simple_mode()
      local mode_hl_name = mode and ('lualine_a_' .. mode) or 'lualine_a_normal'
      local mode_hl = vim.api.nvim_get_hl(0, { name = mode_hl_name })
      vim.api.nvim_set_hl(0, 'SmoothCursor', {
        fg = mode_hl.bg,
      })
    end

    local function sync_cursorlinesign()
      local cursorline_hl = vim.api.nvim_get_hl(0, { name = 'CursorLine' })
      vim.api.nvim_set_hl(0, 'CursorLineSign', {
        bg = get_simple_mode() == 'visual' and 'NONE' or cursorline_hl.bg,
      })
    end

    -- NOTE: ModeChanged seemingly doesn't fire until after potential keymaps. Not sure how Lualine responds immediately.
    vim.api.nvim_create_autocmd({ 'ModeChanged', 'ColorScheme' }, {
      callback = function()
        vim.schedule(function()
          sync_cursor_sign()
          sync_cursorlinesign()
        end)
      end,
    })

    sync_cursor_sign()
    sync_cursorlinesign()
  end,
}
