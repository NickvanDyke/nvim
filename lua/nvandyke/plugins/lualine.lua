return {
  'nvim-lualine/lualine.nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    'meuter/lualine-so-fancy.nvim',
    'AndreM222/copilot-lualine',
    'otavioschwanck/arrow.nvim',
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

    local arrow = {
      function()
        return require('arrow.statusline').text_for_statusline_with_icons()
      end,
    }

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
          function()
            ---@diagnostic disable-next-line: undefined-field
            return ' ' .. vim.fn.fnamemodify(vim.loop.cwd(), ':t')
          end,
          {
            'branch',
            cond = function()
              return vim.o.columns >= 120
            end,
          },
          'diagnostics',
        },
        lualine_c = {
          {
            'windows',
            show_filename_only = false,
            show_modified_status = false,
            filetype_names = {
              ['snacks_dashboard'] = 'Dashboard',
            },
          },
        },
        lualine_x = {
          arrow,
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
