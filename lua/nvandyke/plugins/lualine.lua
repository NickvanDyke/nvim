return {
  'nvim-lualine/lualine.nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    'meuter/lualine-so-fancy.nvim',
    'AndreM222/copilot-lualine',
  },
  config = function()
    local lualine = require 'lualine'
    local codecompanion = require 'nvandyke.lualine-codecompanion'
    -- local trouble = require 'trouble'
    -- local symbols = trouble.statusline {
    --   mode = 'lsp_document_symbols',
    --   groups = {},
    --   title = false,
    --   filter = { range = true },
    --   format = '{kind_icon}{symbol.name:Normal}',
    --   -- The following line is needed to fix the background color
    --   -- Set it to the lualine section you want to use
    --   hl_group = 'lualine_c_normal',
    -- }

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

    local function count_items(qf_list)
      if #qf_list > 0 then
        local valid = 0
        for _, item in ipairs(qf_list) do
          if item.valid == 1 then
            valid = valid + 1
          end
        end
        if valid > 0 then
          return tostring(valid)
        end
      end
    end

    local ll = {
      function()
        local loc_values = vim.fn.getloclist(vim.api.nvim_get_current_win())
        local items = count_items(loc_values)
        if items then
          return 'll:' .. items
        end
        return ''
      end,
      on_click = function(clicks, button, modifiers)
        local winid = vim.fn.getqflist(vim.api.nvim_get_current_win(), { winid = 0 }).winid
        if winid == 0 then
          vim.cmd.lopen()
        else
          vim.cmd.lclose()
        end
      end,
    }
    local qf = {
      function()
        local qf_values = vim.fn.getqflist()
        local items = count_items(qf_values)
        if items then
          return 'qf:' .. items
        end
        return ''
      end,
      on_click = function(clicks, button, modifiers)
        local winid = vim.fn.getqflist({ winid = 0 }).winid
        if winid == 0 then
          vim.cmd.copen()
        else
          vim.cmd.cclose()
        end
      end,
    }
    local arrow = {
      function ()
        return require('arrow.statusline').text_for_statusline_with_icons()
      end
    }

    lualine.setup {
      options = {
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
      },
      sections = {
        lualine_b = {
          'branch',
          'diagnostics',
        },
        lualine_c = {
          {
            'filename',
            path = 0,
            -- fmt = function(str)
            --   return string.gsub(str, '/', ' > ')
            -- end,
          },
          -- {
          --   symbols.get,
          --   cond = symbols.has
          -- }
        },
        lualine_x = { {
          'filetype',
          -- Doesn't work :/ https://github.com/nvim-lualine/lualine.nvim/pull/236/files
          disable_text = true,
        } },
        lualine_y = {
          codecompanion,
          'fancy_macro',
          'fancy_searchcount',
          -- ll,
          -- qf,
          arrow,
          {
            'copilot',
            symbols = {
              -- The idle symbol has a right-space but the spinners don't
              spinners = { '⠋ ', '⠙ ', '⠹ ', '⠸ ', '⠼ ', '⠴ ', '⠦ ', '⠧ ', '⠇ ', '⠏ ' },
            },
          },
          -- 'progress',
        },
      },
      winbar = {},
      inactive_winbar = {},
    }
  end,
}
