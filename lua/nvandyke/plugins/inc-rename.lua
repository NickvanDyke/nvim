return {
  'smjonas/inc-rename.nvim',
  config = function()
    require('inc_rename').setup({})
    vim.keymap.set('n', '<leader>cr', function()
      return ':IncRename ' .. vim.fn.expand '<cword>'
    end, { expr = true, desc = 'IncRename' })
  end,
}
