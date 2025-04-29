return {
  'stevearc/quicker.nvim',
  event = 'FileType qf',
  ---@module "quicker"
  ---@type quicker.SetupOptions
  opts = {
    opts = {
      signcolumn = 'yes',
      winfixheight = false, -- Let focus.nvim handle the height
    },
    edit = {
      autosave = true,
    },
    highlight = {
      -- Better highlighting
      load_buffers = true,
    },
    follow = {
      enable = true,
    },
  },
  keys = {
    {
      '<leader>qf',
      function()
        require('quicker').toggle()
      end,
      desc = 'Toggle quickfix',
      mode = 'n',
    },
    {
      '<leader>ql',
      function()
        require('quicker').toggle { loclist = true }
      end,
      desc = 'Toggle loclist',
      mode = 'n',
    },
    {
      '>',
      function()
        if vim.bo.filetype == 'qf' then
          require('quicker').expand { before = 2, after = 2, add_to_existing = true }
        else
          return '>'
        end
      end,
      desc = 'Expand quickfix context',
      -- Causes error when it triggers the qf function. Not sure why.
      expr = true,
    },
    {
      '<',
      function()
        if vim.bo.filetype == 'qf' then
          require('quicker').collapse()
        else
          return '<'
        end
      end,
      desc = 'Collapse quickfix context',
      expr = true,
    },
  },
}
