return {
  'zk-org/zk-nvim',
  event = 'VeryLazy',
  opts = {
    picker = 'telescope',
  },
  ft = { 'markdown' },
  keys = {
    { '<leader>zn', "<Cmd>ZkNew { dir = vim.fn.expand('%:p:h'), title = vim.fn.input('Title: ') }<CR>", mode = 'n', buffer = 0, desc = 'New note' },
    { '<leader>znt', ":'<,'>ZkNewFromTitleSelection { dir = vim.fn.expand('%:p:h') }<CR>", mode = 'v', buffer = 0 },
    { '<leader>znc', ":'<,'>ZkNewFromContentSelection { dir = vim.fn.expand('%:p:h'), title = vim.fn.input('Title: ') }<CR>", mode = 'v', buffer = 0 },
    { '<leader>zb', '<Cmd>ZkBacklinks<CR>', mode = 'n', buffer = 0, desc = 'Backlinks' },
    { '<leader>zl', '<Cmd>ZkLinks<CR>', mode = 'n', buffer = 0, desc = 'Links' },
    { '<leader>za', ":'<,'>lua vim.lsp.buf.range_code_action()<CR>", mode = 'v', buffer = 0, desc = 'Actions' },
    { '<leader>zjd', "<Cmd>ZkNew { dir = 'journal/daily', group = 'daily' }<CR>", desc = 'Daily journal' },
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
