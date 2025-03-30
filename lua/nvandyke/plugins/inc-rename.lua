return {
  'smjonas/inc-rename.nvim',
  opts = {},
  keys = {
    {
      'grn',
      function()
        return ':IncRename ' .. vim.fn.expand '<cword>'
      end,
      desc = 'IncRename',
      expr = true,
    },
  },
}
