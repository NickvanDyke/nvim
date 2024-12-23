return {
  'zk-org/zk-nvim',
  event = 'VeryLazy',
  opts = {
    picker = 'telescope',
  },
  config = function(_, opts)
    require('zk').setup(opts)

    -- `keys` doesn't seem to play nice
    vim.api.nvim_set_keymap(
      'n',
      '<leader>zn',
      "<Cmd>ZkNew { dir = vim.fn.expand('%:p:h'), title = vim.fn.input('Title: ') }<CR>",
      { noremap = true, silent = true, desc = 'New note' }
    )
    vim.api.nvim_set_keymap('v', '<leader>znt', ":'<,'>ZkNewFromTitleSelection { dir = vim.fn.expand('%:p:h') }<CR>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap(
      'v',
      '<leader>znc',
      ":'<,'>ZkNewFromContentSelection { dir = vim.fn.expand('%:p:h'), title = vim.fn.input('Title: ') }<CR>",
      { noremap = true, silent = true }
    )
    vim.api.nvim_set_keymap('n', '<leader>zb', '<Cmd>ZkBacklinks<CR>', { noremap = true, silent = true, desc = 'Backlinks' })
    vim.api.nvim_set_keymap('n', '<leader>zl', '<Cmd>ZkLinks<CR>', { noremap = true, silent = true, desc = 'Links' })
    vim.api.nvim_set_keymap('v', '<leader>za', ":'<,'>lua vim.lsp.buf.range_code_action()<CR>", { noremap = true, silent = true, desc = 'Actions' })
    vim.api.nvim_set_keymap(
      'n',
      '<leader>zd',
      "<Cmd>ZkNew { dir = 'journal/daily', group = 'daily' }<CR>",
      { noremap = true, silent = true, desc = 'Daily journal' }
    )

    local zk = require 'zk'
    local commands = require 'zk.commands'
    commands.add('ZkOrphans', function(options)
      options = vim.tbl_extend('force', { orphan = true }, options or {})
      zk.edit(options, { title = 'Orphans' })
    end)
  end,
}
