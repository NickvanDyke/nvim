return {
  'zk-org/zk-nvim',
  cmd = 'ZkOrphans',
  ft = 'markdown',
  opts = {
    picker = 'snacks_picker',
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
      ":'<,'>ZkNewFromTitleSelection { dir = vim.fn.getcwd() }<CR>",
      mode = 'v',
      noremap = true,
      silent = true,
      desc = 'New from title selection',
    },
    {
      '<leader>znc',
      ":'<,'>ZkNewFromContentSelection { dir = vim.fn.getcwd(), title = vim.fn.input('Title: ') }<CR>",
      mode = 'v',
      silent = true,
      desc = 'New from content selection',
    },
    { '<leader>zb', '<Cmd>ZkBacklinks<CR>', mode = 'n', silent = true, desc = 'Backlinks' },
    { '<leader>zl', '<Cmd>ZkLinks<CR>', mode = 'n', silent = true, desc = 'Links' },
    { '<leader>za', ":'<,'>lua vim.lsp.buf.range_code_action()<CR>", mode = 'v', silent = true, desc = 'Actions' },
    { '<leader>zd', "<Cmd>ZkNew { dir = 'journal/daily', group = 'daily' }<CR>", mode = 'n', silent = true, desc = 'Daily journal' },
    {
      -- snacks gd doesn't work for some reason
      '<leader>zf',
      function()
        vim.lsp.buf.definition()
      end,
      mode = 'n',
      desc = 'Follow link',
    },
    {
      '<leader>znn',
      ":'<,'>ZkNewFromTitleAndContentSelection { dir = vim.fn.getcwd() }<CR>",
      function() end,
      mode = 'v',
      desc = 'New from title and content selection',
    },
  },
  config = function(_, opts)
    require('zk').setup(opts)

    local zk = require 'zk'
    local util = require 'zk.util'
    local commands = require 'zk.commands'

    commands.add('ZkOrphans', function(options)
      options = vim.tbl_extend('force', { orphan = true }, options or {})
      zk.edit(options, { title = 'Orphans' })
    end)

    commands.add('ZkNewFromTitleAndContentSelection', function(options)
      local location = util.get_lsp_location_from_selection()
      local selected_text = util.get_selected_text()
      assert(selected_text ~= nil, 'No selected text')

      local newline_index = string.find(selected_text, '\n')
      assert(newline_index ~= nil, 'No newline found in selection to separate title and content')

      local title = string.sub(selected_text, string.find(selected_text, '%a') or 1, newline_index - 1)
      -- assumes two newlines separate title and content (per markdown spec)
      -- TODO: would be nice to detect location instead
      local content = string.sub(selected_text, newline_index + 2)

      zk.new {
        dir = vim.fn.expand '%:p:h',
        title = vim.fn.input('Title: ', title),
        content = content,
        insertLinkAtLocation = location,
      }
    end, { needs_selection = true })
  end,
}
