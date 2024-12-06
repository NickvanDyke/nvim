return {
  'nvim-lualine/lualine.nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    'meuter/lualine-so-fancy.nvim',
    'AndreM222/copilot-lualine',
  },
  config = function()
    local lualine = require 'lualine'

    -- local function diff_source()
    --   local gitsigns = vim.b.gitsigns_status_dict
    --   if gitsigns then
    --     return {
    --       added = gitsigns.added,
    --       modified = gitsigns.changed,
    --       removed = gitsigns.removed,
    --     }
    --   end
    -- end

    lualine.setup {
      options = {
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
      },
      -- winbar = {
      --   lualine_c = { {'filename', path = 1} },
      -- },
      -- inactive_winbar = {},
      sections = {
        lualine_a = {
          {
            'mode',
            fmt = function(str)
              local length = vim.o.columns >= 120 and 8 or 1
              return string.sub(str, 0, length)
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
            'branch',
            icon = '',
            cond = function()
              return vim.o.columns >= 80
            end,
            fmt = function(str)
              if string.len(str) > 11 then
                return string.sub(str, 1, 11) .. '…'
                -- return string.sub(str, 1, 5) .. '…' .. string.sub(str, -5)
              else
                return str
              end
            end,
          },
          'diagnostics',
        },
        lualine_c = {
          {
            'windows',
            show_modified_status = false,
            filetype_names = {
              ['snacks_dashboard'] = 'Dashboard',
            },
            fmt = function(str, ctx)
              local filename = str --vim.fn.fnamemodify(vim.api.nvim_buf_get_name(ctx.bufnr), ':t')
              local filename_to_show = filename:match '^index%..+$'
                  -- prefix parent dir
                  and vim.fn.fnamemodify(vim.fn.fnamemodify(vim.api.nvim_buf_get_name(ctx.bufnr), ':h'), ':t') .. '/' .. filename
                or filename

              -- Takes a long time to load and we'll never need on the Dashboard
              local arrow_icon = package.loaded['arrow'] and require('arrow.statusline').text_for_statusline_with_icons(ctx.bufnr) or nil
              return arrow_icon and (filename_to_show .. ' ' .. arrow_icon) or filename_to_show
            end,
          },
        },
        lualine_x = {
          -- {
          --   'filetype',
          --   icon_only = true,
          -- },
        },
        lualine_y = {
          'fancy_macro',
          'fancy_searchcount',
          {
            'copilot',
            symbols = {
              -- The idle symbol has a right-space but the spinners don't
              spinners = { '⠋ ', '⠙ ', '⠹ ', '⠸ ', '⠼ ', '⠴ ', '⠦ ', '⠧ ', '⠇ ', '⠏ ' },
            },
          },
        },
      },
    }
  end,
}
