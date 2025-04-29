return {
  'nvim-focus/focus.nvim',
  event = 'WinNew',
  opts = {
    autoresize = {
      -- minwidth = 3, -- Force minimum width for the unfocused window
      -- minheight = 3, -- Force minimum height for the unfocused window
    },
    ui = {
      -- Kinda disorienting to have this constantly flicker.
      -- Doesn't play well with floating windows either.
      signcolumn = false,

      -- it doesn't properly re-enable cursorline when returning from a floating window
      cursorline = false,
    },
  },
  keys = {
    {
      '<c-w>f',
      function()
        require('focus').split_nicely()
      end,
      desc = 'Split nicely',
    },
  },
  init = function()
    local ignore_filetypes = { 'qf' }
    local augroup = vim.api.nvim_create_augroup('FocusDisable', { clear = true })
    vim.api.nvim_create_autocmd('FileType', {
      group = augroup,
      callback = function(_)
        if vim.tbl_contains(ignore_filetypes, vim.bo.filetype) then
          vim.b.focus_disable = true
        else
          vim.b.focus_disable = false
        end
      end,
      desc = 'Disable focus autoresize for FileType',
    })
  end,
}
