return {
  'folke/snacks.nvim',
  dependencies = { 'folke/persistence.nvim' },
  priority = 1000,
  lazy = false,
  opts = {
    dashboard = {
      enabled = true,

      sections = {
        { section = 'header' },
        { icon = ' ', title = 'Keymaps', section = 'keys', indent = 2, padding = 1 },
        { icon = ' ', title = 'Recent Files', section = 'recent_files', indent = 2, padding = 1 },
        { icon = ' ', title = 'Projects', section = 'projects', indent = 2, padding = 1 },
        { section = 'startup' },
      },
    },
    bigfile = { enabled = true },
    terminal = {
      enabled = true,
      win = {
        wo = {
          -- TODO: how to disable this? Don't need with prompt
          winbar = nil,
        },
      },
    },
    lazygit = { enabled = true },
    words = { enabled = true },
    statuscolumn = { enabled = false },
    notifier = {
      enabled = false,
      top_down = false,
      -- style = 'minimal'
    },
    styles = {},
  },
  keys = {
    {
      ']]',
      function()
        Snacks.words.jump(vim.v.count1)
      end,
      desc = 'Next Reference',
    },
    {
      '[[',
      function()
        Snacks.words.jump(-vim.v.count1)
      end,
      desc = 'Prev Reference',
    },
    {
      '<C-t>',
      function()
        Snacks.terminal()
      end,
      desc = 'Toggle Terminal',
    },
    {
      '<leader>ld',
      function()
        Snacks.terminal 'lazydocker'
      end,
      desc = '[L]azy [D]ocker',
    },
    {
      '<leader>lg',
      function()
        Snacks.lazygit.open()
      end,
      desc = '[L]azy [G]it',
    },
    {
      '<leader>gf',
      function()
        Snacks.lazygit.log_file()
      end,
      desc = 'LazyGit log (current [f]ile)',
    },
    {
      '<leader>gl',
      function()
        Snacks.lazygit.log()
      end,
      desc = 'LazyGit [l]og',
    },
  },
  config = function(_, opts)
    require('snacks').setup(opts)
  end,
}
