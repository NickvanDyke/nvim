return {
  'nvim-lualine/lualine.nvim',
  event = 'VeryLazy',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    'letieu/harpoon-lualine',
  },
  config = function()
    local function diff_source()
      local gitsigns = vim.b.gitsigns_status_dict
      if gitsigns then
        return {
          added = gitsigns.added,
          modified = gitsigns.changed,
          removed = gitsigns.removed,
        }
      end
    end

    -- FIX: Flickering. https://github.com/nvim-lualine/lualine.nvim/issues/1280

    require('lualine').setup {
      options = {
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        always_show_tabline = false,
      },
      tabline = {
        lualine_z = {
          'tabs',
        },
      },
      sections = {
        lualine_a = {
          {
            'mode',
            fmt = function(str)
              return string.sub(str, 0, 1)
            end,
          },
        },
        lualine_b = {
          {
            function()
              ---@diagnostic disable-next-line: undefined-field
              return vim.fn.fnamemodify(vim.loop.cwd(), ':t')
            end,
            icon = '', -- Same as my powerline prompt
          },
          {
            'b:gitsigns_head', -- NOTE: based on open file I think. Thus disappears when e.g. lazygit is focused
            icon = '',
            fmt = function(str)
              -- 8 is just enough to show the Jira ticket
              if string.len(str) > 8 and vim.o.columns < 120 then
                return string.sub(str, 1, 8) .. '…'
              else
                return str
              end
            end,
          },
          {
            'diff',
            source = diff_source,
            cond = function()
              return false
            end,
          },
          'diagnostics',
        },
        lualine_c = {},
        lualine_x = {
          {
            'filename',
            path = 1,
            padding = 0,
            fmt = function(str, ctx)
              local parts = vim.split(str, '/')
              local filename

              -- local gitsigns = vim.b.gitsigns_status_dict
              -- if gitsigns and (gitsigns.changed > 0 or gitsigns.added > 0 or gitsigns.removed > 0) then
              --   filename = '%#LualineFilenameChanged#' .. parts[#parts] .. ' %*'
              -- else
              filename = '%#LualineFilename#' .. parts[#parts] .. ' %*'
              -- end

              -- local filename_to_show = filename:match '^index%..+$'
              --     -- prefix parent dir
              --     and vim.fn.fnamemodify(vim.fn.fnamemodify(vim.api.nvim_buf_get_name(ctx.bufnr), ':h'), ':t') .. '/' .. filename
              --   or filename
              if #parts == 1 then
                return filename
              else
                local filepath = table.concat(parts, '/', 1, #parts - 1)
                return '%#LualineFilepath#' .. filepath .. '/' .. '%*' .. filename
              end
            end,
            separator = { right = '' },
          },
          { 'filetype', icon_only = true, padding = 0, section_separators = { left = '' } },
          {
            function(ctx)
              return require('arrow.statusline').text_for_statusline_with_icons(ctx.bufnr)
            end,
            cond = function()
              return package.loaded['arrow'] ~= nil
            end,
            color = { fg = '#66ff66' },
          },
          {
            'harpoon2',
            icon = '♥',
            indicators = { '1', '2', '3', '4', '5' },
            active_indicators = { '1', '2', '3', '4', '5' },
            color_active = { fg = '#66ff66' },
            _separator = ' ',
            no_harpoon = '...',
          },
        },
        lualine_y = {
          {
            require('noice').api.statusline.mode.get,
            cond = require('noice').api.statusline.mode.has,
            fmt = function(str)
              return '󰑋 ' .. string.sub(str, #str)
            end,
            color = { fg = '#ff0000' },
          },
        },
      },
    }

    local function createFilepathHighlights()
      -- FIX: background gets out of sync after changing colorscheme
      -- `lualine_hl` ends up as an empty dict after changing colorscheme...?
      local lualine_hl = vim.api.nvim_get_hl(0, { name = 'lualine_c_normal' })
      local comment_hl = vim.api.nvim_get_hl(0, { name = 'Comment' })
      -- local gitsigns_hl = vim.api.nvim_get_hl_by_name('GitSignsChange', true)

      vim.api.nvim_set_hl(0, 'LualineFilepath', {
        italic = true,
        bg = lualine_hl.bg,
        fg = comment_hl.fg,
      })
      vim.api.nvim_set_hl(0, 'LualineFilename', {
        bold = true,
        bg = lualine_hl.bg,
      })
      -- vim.api.nvim_set_hl(0, 'LualineFilenameChanged', { bold = true, fg = gitsigns_hl.foreground, bg = lualine_hl.background })
    end

    -- Must be called after colorscheme is loaded.
    -- This also re-creates the highlight groups when the colorscheme changes.
    vim.api.nvim_create_autocmd('ColorScheme', {
      callback = createFilepathHighlights,
    })

    -- We're lazy-loaded, so the colorscheme has already been set by the time we register the autocmd.
    -- So call it immediately.
    createFilepathHighlights()
  end,
}
