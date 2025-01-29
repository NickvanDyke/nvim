return {
  'zk-org/zk-nvim',
  cmd = 'ZkOrphans',
  ft = 'markdown',
  opts = {
    picker = 'select',
  },
  keys = {
    {
      '<leader>zn',
      "<Cmd>ZkNew { dir = vim.fn.expand('%:p:h'), title = vim.fn.input('Title: ') }<CR>",
      mode = 'n',
      silent = true,
      desc = 'New note',
    },
    -- autocomplete doesn't seem to work rn...
    {
      '<leader>zi',
      '<Cmd>ZkInsertLink<CR>',
      mode = 'n',
      silent = true,
      desc = 'Insert link',
    },
    {
      '<leader>znt',
      ":'<,'>ZkNewFromTitleSelection { dir = vim.fn.expand('%:p:h') }<CR>",
      mode = 'v',
      noremap = true,
      silent = true,
      desc = 'New from title selection',
    },
    {
      '<leader>znc',
      ":'<,'>ZkNewFromContentSelection { dir = vim.fn.expand('%:p:h'), title = vim.fn.input('Title: ') }<CR>",
      mode = 'v',
      silent = true,
      desc = 'New from content selection',
    },
    { '<leader>zb', '<Cmd>ZkBacklinks<CR>', mode = 'n', silent = true, desc = 'Backlinks' },
    { '<leader>zl', '<Cmd>ZkLinks<CR>', mode = 'n', silent = true, desc = 'Links' },
    { '<leader>za', ":'<,'>lua vim.lsp.buf.range_code_action()<CR>", mode = 'v', silent = true, desc = 'Actions' },
    { '<leader>zd', "<Cmd>ZkNew { dir = 'journal/daily', group = 'daily' }<CR>", mode = 'n', silent = true, desc = 'Daily journal' },
    {
      -- snacks goto doesn't work for some reason
      '<leader>zf',
      function()
        vim.lsp.buf.definition()
      end,
      mode = 'n',
      desc = 'Follow link',
    },
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
