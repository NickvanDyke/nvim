return {
  'cbochs/portal.nvim',
  opts = {
    window_options = {
      border = vim.g.border_default,
      height = 5,
    },
  },
  cmd = 'Portal',
  keys = {
    {
      '<S-C-o>',
      function()
        require('portal.builtin').jumplist {
          direction = 'backward',
        }
      end,
      desc = 'Portal',
      mode = 'n',
    },
    {
      '<S-C-i>',
      function()
        require('portal.builtin').jumplist {
          direction = 'forward',
        }
      end,
      desc = 'Portal',
      mode = 'n',
    },
  },
}
