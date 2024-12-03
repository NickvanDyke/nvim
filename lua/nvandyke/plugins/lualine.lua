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
              local width = vim.fn.winwidth(0)
              local length = width >= 120 and 8 or 1
              return string.sub(str, 0, length)
            end,
          },
        },
        lualine_b = {
          {
            'branch',
            cond = function()
              return vim.fn.winwidth(0) > 120
            end,
          },
          'diagnostics',
        },
        lualine_c = {
          -- TODO: https://github.com/LazyVim/LazyVim/discussions/2605#discussioncomment-8653080
          {
            'filename',
            path = 1,
            -- color = 'NeoTreeGitModified'
            -- fmt = function(str)
            --   return string.gsub(str, '/', ' > ')
            -- end,
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
