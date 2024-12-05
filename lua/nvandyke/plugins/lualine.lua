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
                return string.sub(str, 1, 5) .. '…' .. string.sub(str, -5)
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
              -- arrow takes a long time to load and we'll never need it on the dashboard
              local arrow_is_loaded = package.loaded['arrow']
              if not arrow_is_loaded then
                return str
              else
                local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(ctx.bufnr), ':t')
                if filename:match '^index%..+$' then
                  local parent_dir = vim.fn.fnamemodify(vim.fn.fnamemodify(vim.api.nvim_buf_get_name(ctx.bufnr), ':h'), ':t')
                  return parent_dir .. '/' .. filename
                end
                return str .. ' ' .. require('arrow.statusline').text_for_statusline_with_icons(ctx.bufnr)
              end
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
