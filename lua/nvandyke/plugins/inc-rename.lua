return {
  'smjonas/inc-rename.nvim',
  keys = {
    {
      'grn',
      function()
        return ':IncRename ' .. vim.fn.expand '<cword>'
      end,
      desc = 'Rename',
      expr = true,
    },
    {
      '<leader>cr',
      function()
        return ':IncRename ' .. vim.fn.expand '<cword>'
      end,
      desc = 'Rename',
      expr = true,
    },
  },
}
