return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  opts = {
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
    statuscolumn = { enabled = false }, -- tf, is everything enabled by default?
    notifier = { enabled = false },
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
      '<C-w><C-b>',
      function()
        Snacks.bufdelete()
      end,
      desc = 'Delete Buffer',
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
      '<leader>gg',
      function()
        Snacks.lazygit.open()
      end,
      desc = 'LazyGit',
    },
    {
      '<leader>gf',
      function()
        Snacks.lazygit.log_file()
      end,
      desc = 'LazyGit log (current file)',
    },
    {
      '<leader>gl',
      function()
        Snacks.lazygit.log()
      end,
      desc = 'LazyGit log',
    }
  },
}
