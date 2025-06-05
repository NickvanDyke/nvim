return {
  'nvim-lualine/lualine.nvim',
  event = 'VeryLazy',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    'ThePrimeagen/harpoon',
    'letieu/harpoon-lualine',
  },
  config = function()
    vim.o.laststatus = 3 -- works better with globalstatus

    local lualine_ai = require 'nvandyke.lualine-ai'

    require('lualine').setup {
      globalstatus = true,
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
              local cwd = vim.fn.fnamemodify(vim.fn.getcwd(), ':t')
              local target_len = vim.o.columns / 7
              if string.len(cwd) > target_len then
                return string.sub(cwd, 1, target_len) .. '…'
              else
                return cwd
              end
            end,
            icon = '', -- Same as my powerline prompt
          },
          {
            'branch',
            icon = '',
            fmt = function(str)
              local target_len = vim.o.columns / 7
              if string.len(str) > target_len then
                return string.sub(str, 1, target_len) .. '…'
              else
                return str
              end
            end,
          },
        },
        lualine_c = {
          {
            'b:minidiff_summary_string',
          },
          'diagnostics',
        },
        lualine_x = {
          {
            'filename',
            path = 1,
            fmt = function(str)
              local parts = vim.split(str, '/')
              local filename = parts[#parts]

              local filename_hl_name = 'LualineFilename'
              -- local gitsigns = vim.b.gitsigns_status_dict
              -- if gitsigns and (gitsigns.changed ~= nil or gitsigns.added ~= nil or gitsigns.removed ~= nil) then
              --   filename_hl_name = 'LualineFilenameChanged'
              -- end

              filename = '%#' .. filename_hl_name .. '#' .. filename .. '%*'

              -- local is_index_file = filename:match '^index%..+$'
              if #parts == 1 then
                return filename
              else
                local filepath = table.concat(parts, '/', 1, #parts - 1)
                return '%#LualineFilepath#' .. filepath .. '/' .. '%*' .. filename
              end
            end,
            separator = '',
          },
          { 'filetype', icon_only = true, padding = 0, separator = '' },
          {
            function()
              local chars = { '⎺', '⎻', '─', '⎼', '⎽' }

              local progress = math.floor((vim.fn.line '.' / vim.fn.line '$') * 100)
              local indexBucket = math.min(#chars, math.floor(progress / (100 / #chars)) + 1)
              local progressChar = chars[indexBucket]

              return progressChar
            end,
            padding = { left = 0, right = 1 },
            color = { fg = '#ff0000' },
          },
          {
            'harpoon2',
            icon = '♥',
            indicators = { '1', '2', '3', '4', '5' },
            active_indicators = { '1', '2', '3', '4', '5' },
            color_active = { fg = '#A7C080' },
            no_harpoon = '...',
          },
        },
        lualine_y = {
          -- {
          --   require('noice').api.status.command.get,
          --   cond = require('noice').api.status.command.has,
          -- },
          {
            require('noice').api.status.mode.get,
            cond = require('noice').api.status.mode.has,
            fmt = function(str)
              return '󰑋 ' .. string.sub(str, #str)
            end,
            color = { fg = '#ff0000' },
          },
          {
            'searchcount',
            icon = '',
            fmt = function(str)
              return str:gsub('[%[%]|]', '')
            end,
          },
        },
        lualine_z = {
          -- {
          --   'location',
          --   separator = '',
          -- },
          {
            lualine_ai,
            padding = { left = 1, right = 0 },
          },
        },
      },
    }

    local function createFilepathHighlights()
      local lualine_hl = vim.api.nvim_get_hl(0, { name = 'lualine_c_normal' })
      local comment_hl = vim.api.nvim_get_hl(0, { name = 'Comment' })

      vim.api.nvim_set_hl(0, 'LualineFilepath', {
        italic = true,
        bg = lualine_hl.bg,
        fg = comment_hl.fg,
      })
      vim.api.nvim_set_hl(0, 'LualineFilename', {
        bold = true,
        bg = lualine_hl.bg,
      })
    end

    vim.api.nvim_create_autocmd('ColorScheme', {
      callback = function()
        -- Schedule so we can wait for lualine to set up its highlights
        vim.schedule(createFilepathHighlights)
      end,
    })
  end,
}
