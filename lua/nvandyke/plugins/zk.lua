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

    -- PR denied :(
    -- https://github.com/zk-org/zk-nvim/pull/210
    commands.add('ZkNewFromTitleAndContentSelection', function(options)
      local location = util.get_lsp_location_from_selection()
      local selected_text = util.get_selected_text()
      assert(selected_text ~= nil, 'No selected text')

      local title, content = selected_text:match '%W*([^\n]+)\n+(.+)$'
      assert(title ~= nil or content ~= nil, 'No newline-delimited title and content found in selection')

      options = options or {}
      options.title = vim.fn.input('Title: ', title)
      options.content = content

      if options.inline == true then
        options.inline = nil
        options.dryRun = true
        options.insertContentAtLocation = location
      else
        options.insertLinkAtLocation = location
      end

      zk.new(options)
    end, { needs_selection = true })
  end,
}
