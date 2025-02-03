return {
  'smjonas/inc-rename.nvim',
  opts = {},
  keys = {
    {
      '<leader>cr',
      function()
        return ':IncRename ' .. vim.fn.expand '<cword>'
      end,
      desc = 'IncRename',
      expr = true,
    },
  },
}
