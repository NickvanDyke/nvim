return {
  'b0o/incline.nvim',
  enabled = false,
  config = function()
    local devicons = require 'nvim-web-devicons'
    require('incline').setup {
      window = {
        -- padding = 0,
      },
      -- highlight = {
      --   groups = {
      --     InclineNormal = { guibg = 'none' },
      --     InclineNormalNC = { guibg = 'none' },
      --   },
      -- },
      render = function(props)
        local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ':t')
        if filename == '' then
          filename = '[No Name]'
        end
        local ft_icon, ft_color = devicons.get_icon_color(filename)

        local function get_git_diff()
          local icons = { delete = '', change = '', add = '' }
          local signs = vim.b[props.buf].minidiff_summary
          local labels = {}
          if signs == nil then
            return labels
          end
          for name, icon in pairs(icons) do
            if tonumber(signs[name]) and signs[name] > 0 then
              table.insert(labels, { icon .. ' ' .. signs[name] .. ' ', group = 'MiniDiffSign' .. name })
            end
          end
          if #labels > 0 then
            table.insert(labels, { '| ' })
          end
          return labels
        end

        local function get_diagnostic_label()
          local icons = { error = '', warn = '', info = '', hint = '' }
          local label = {}

          for severity, icon in pairs(icons) do
            local n = #vim.diagnostic.get(props.buf, { severity = vim.diagnostic.severity[string.upper(severity)] })
            if n > 0 then
              table.insert(label, { icon .. ' ' .. n .. ' ', group = 'DiagnosticSign' .. severity })
            end
          end
          if #label > 0 then
            table.insert(label, { '| ' })
          end
          return label
        end

        local function get_grapple_tags()
          local grapple = require 'grapple'
          local tags = grapple.tags() or {}
          local label = {}
          for _, tag in ipairs(tags) do
            table.insert(label, { tag.name })
          end

          return label
        end

        -- local hl = vim.api.nvim_get_hl(0, { name = 'NormalFloat', link = false })
        -- local bg = string.format('#%06x', hl.bg)

        return {
          -- { '', guifg = bg },
          { get_diagnostic_label() },
          { get_git_diff() },
          { ((ft_icon .. ' ') or ''), guifg = ft_color, guibg = 'none' },
          { filename, gui = vim.bo[props.buf].modified and 'bold,italic' or 'bold' },
          -- { get_grapple_tags() },
          -- { '', guifg = bg },
        }
      end,
    }
  end,
}
