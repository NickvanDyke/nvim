return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons', 'meuter/lualine-so-fancy.nvim' },
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

    lualine.setup {
      options = {
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
      },
      sections = {
        lualine_b = { { 'diff', source = diff_source } },
        lualine_c = {
          {
            'filename',
            path = 1,
            -- fmt = function(str)
            --   return string.gsub(str, '/', ' > ')
            -- end,
          },
          -- {
          --   symbols.get,
          --   cond = symbols.has
          -- }
        },
        lualine_x = { 'filetype' },
        lualine_y = { codecompanion, 'fancy_macro', 'progress' },
      },
      winbar = {},
      inactive_winbar = {},
    }
  end,
}
