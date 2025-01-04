return {
  'zk-org/zk-nvim',
  cmd = 'ZkOrphans',
  ft = 'markdown',
  opts = {
    picker = 'telescope',
  },

  keys = {
    {
      '<leader>zn',
      "<Cmd>ZkNew { dir = vim.fn.expand('%:p:h'), title = vim.fn.input('Title: ') }<CR>",
      mode = 'n',
      silent = true,
      desc = 'New note',
    },
    { '<leader>znt', ":'<,'>ZkNewFromTitleSelection { dir = vim.fn.expand('%:p:h') }<CR>", mode = 'v', noremap = true, silent = true },
    {
      '<leader>znc',
      ":'<,'>ZkNewFromContentSelection { dir = vim.fn.expand('%:p:h'), title = vim.fn.input('Title: ') }<CR>",
      mode = 'v',
      silent = true,
    },
    { '<leader>zb', '<Cmd>ZkBacklinks<CR>', mode = 'n', silent = true, desc = 'Backlinks' },
    { '<leader>zl', '<Cmd>ZkLinks<CR>', mode = 'n', silent = true, desc = 'Links' },
    { '<leader>za', ":'<,'>lua vim.lsp.buf.range_code_action()<CR>", mode = 'v', silent = true, desc = 'Actions' },
    { '<leader>zd', "<Cmd>ZkNew { dir = 'journal/daily', group = 'daily' }<CR>", mode = 'n', silent = true, desc = 'Daily journal' },
  },
  config = function(_, opts)
    require('zk').setup(opts)

    local zk = require 'zk'
    local commands = require 'zk.commands'
    commands.add('ZkOrphans', function(options)
      options = vim.tbl_extend('force', { orphan = true }, options or {})
      zk.edit(options, { title = 'Orphans' })
    end)
  end,
}
