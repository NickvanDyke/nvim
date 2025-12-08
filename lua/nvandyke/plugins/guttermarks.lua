return {
  'dimtion/guttermarks.nvim',
  event = { 'BufReadPost', 'BufNewFile', 'BufWritePre' },
  enabled = false,
  opts = {
    special_mark = {
      enabled = true,
    },
  },
  config = function(_, opts)
    require('guttermarks').setup(opts)

    -- Delete the mark under the cursor
    vim.keymap.set('n', 'm;', require('guttermarks.actions').delete_mark, { desc = 'Delete mark under cursor' })

    -- Navigate to next/previous mark in current buffer
    vim.keymap.set('n', ']m', require('guttermarks.actions').next_buf_mark, { desc = 'Next mark in buffer' })
    vim.keymap.set('n', '[m', require('guttermarks.actions').prev_buf_mark, { desc = 'Previous mark in buffer' })

    -- Send marks to quickfix (and open it)
    vim.keymap.set('n', '<C-m>', function()
      require('guttermarks.actions').marks_to_quickfix()
      vim.cmd 'copen'
    end, { desc = 'Send marks to quickfix' })

    vim.api.nvim_set_hl(0, 'GutterMarksLocal', { link = 'Grey' })
    vim.api.nvim_set_hl(0, 'GutterMarksGlobal', { link = 'Grey' })
    vim.api.nvim_set_hl(0, 'GutterMarksSpecial', { link = 'Grey' })
  end,
}
