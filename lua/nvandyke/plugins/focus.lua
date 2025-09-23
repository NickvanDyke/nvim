return {
  'nvim-focus/focus.nvim',
  enabled = false,
  event = 'WinNew',
  opts = {
    autoresize = {
      minwidth = 3, -- Force minimum width for the unfocused window
      minheight = 3, -- Force minimum height for the unfocused window
    },
    ui = {
      -- Kinda disorienting to have this constantly flicker.
      -- Doesn't play well with floating windows either.
      signcolumn = false,
      -- it doesn't properly re-enable cursorline when returning from a floating window
      cursorline = false,
    },
  },
  config = function(_, opts)
    vim.opt.splitkeep = 'cursor'
    require('focus').setup(opts)

    local ignore_filetypes = {
      -- Annoying, and quicker.nvim handles qf height better
      'qf',
      -- Explorer
      -- FIX: No effect??
      'snacks_picker_list',
    }
    vim.api.nvim_create_autocmd('FileType', {
      group = vim.api.nvim_create_augroup('FocusDisable', { clear = true }),
      callback = function(_)
        vim.b.focus_disable = vim.tbl_contains(ignore_filetypes, vim.bo.filetype)
      end,
      desc = 'Disable focus autoresize for FileType',
    })
  end,
  keys = {
    {
      '<c-w>f',
      function()
        require('focus').split_nicely()
      end,
      desc = 'Split nicely',
    },
  },
}
