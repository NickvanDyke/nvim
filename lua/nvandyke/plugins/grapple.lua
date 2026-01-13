return {
  'cbochs/grapple.nvim',
  dependencies = {
    { 'nvim-tree/nvim-web-devicons', lazy = true },
  },
  ---@type grapple.settings
  opts = {
    scope = 'git_branch',
    statusline = {
      icon = '♥',
      active = '%%#lualine_c_normal#%s %%*',
      inactive = '%%#lualine_c_inactive#%s %%*',
    },
  },
  keys = {
    -- {
    --   'm',
    --   function()
    --     local char = vim.fn.getcharstr()
    --     -- Handle ESC, Ctrl-C, etc.
    --     if char == '' or vim.startswith(char, '\\') or vim.startswith(char, '<') then
    --       return
    --     end
    --     local grapple = require 'grapple'
    --     grapple.tag { name = char }
    --     local filepath = vim.api.nvim_buf_get_name(0)
    --     local filename = vim.fn.fnamemodify(filepath, ':t')
    --     vim.notify('Marked ' .. filename .. ' as ' .. char, vim.log.levels.INFO, { title = 'Grapple' })
    --   end,
    --   noremap = true,
    --   silent = true,
    --   desc = 'Save grapple mark',
    -- },
    -- {
    --   "'",
    --   function()
    --     local char = vim.fn.getcharstr()
    --     -- Handle ESC, Ctrl-C, etc.
    --     if char == '' or vim.startswith(char, '\\') or vim.startswith(char, '<') or vim.startswith(char, '^') then
    --       return
    --     end
    --     local grapple = require 'grapple'
    --     if char == "'" then
    --       grapple.toggle_tags()
    --       return
    --     end
    --     grapple.select { name = char }
    --   end,
    --   noremap = true,
    --   silent = true,
    --   desc = 'Open grapple mark',
    -- },
    {
      '<C-g>',
      function()
        require('grapple').toggle()
      end,
      desc = 'Add file to grapple',
    },
    {
      '<C-e>',
      function()
        require('grapple').toggle_tags()
      end,
      desc = 'Toggle grapple menu',
    },
    {
      '<C-1>',
      function()
        require('grapple').select { index = 1 }
      end,
      desc = 'Navigate to file 1',
    },
    {
      '<C-2>',
      function()
        require('grapple').select { index = 2 }
      end,
      desc = 'Navigate to file 2',
    },
    {
      '<C-3>',
      function()
        require('grapple').select { index = 3 }
      end,
      desc = 'Navigate to file 3',
    },
    {
      '<C-4>',
      function()
        require('grapple').select { index = 4 }
      end,
      desc = 'Navigate to file 4',
    },
    {
      '<C-5>',
      function()
        require('grapple').select { index = 5 }
      end,
      desc = 'Navigate to file 5',
    },
  },
}
