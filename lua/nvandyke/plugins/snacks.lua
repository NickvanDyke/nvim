return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  opts = {
    -- explorer = {},
    scope = {},
    dashboard = {
      enabled = true,

      sections = {
        { section = 'header' },
        { icon = ' ', title = 'Keymaps', section = 'keys', indent = 2, padding = 1 },
        { icon = ' ', title = 'Recent Files', section = 'recent_files', indent = 2, padding = 1 },
        -- { icon = ' ', title = 'Projects', section = 'projects', indent = 2, padding = 1 },
        { section = 'startup' },
      },
    },
    bigfile = { enabled = true },
    terminal = {
      enabled = true,
      win = {
        wo = {
          winbar = '',
        },
      },
    },
    lazygit = { enabled = true },
    words = { enabled = true },
    statuscolumn = { enabled = false },
    notifier = { -- Used by noice
      top_down = false,
      style = 'compact',
    },
    scratch = {
      -- ft = 'md', -- Causes error rn
    },
    dim = {},
    styles = {},
  },
  keys = {
    -- {
    --   '\\',
    --   function()
    --     Snacks.explorer.open {
    --       auto_close = true,
    --       jump = { close = true },
    --     }
    --   end,
    --   desc = 'Snacks Explorer',
    -- },
    {
      '<leader>uz',
      function()
        Snacks.zen()
      end,
      desc = 'Toggle Zen Mode',
    },
    {
      '<leader>bdc',
      function()
        Snacks.bufdelete.delete()
      end,
      desc = 'Delete current buffer',
    },
    {
      '<leader>bda',
      function()
        Snacks.bufdelete.all()
      end,
      desc = 'Delete all buffers',
    },
    {
      '<leader>bdo',
      function()
        Snacks.bufdelete.other()
      end,
      desc = 'Delete other buffers',
    },
    {
      '<leader>.',
      function()
        Snacks.scratch()
      end,
      desc = 'Toggle Scratch Buffer',
    },
    -- {
    --   '<leader>S',
    --   function()
    --     Snacks.scratch.select()
    --   end,
    --   desc = 'Select Scratch Buffer',
    -- },
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
      '<C-`>',
      function()
        Snacks.terminal()
      end,
      desc = 'Toggle Terminal',
      mode = { 'n', 't' },
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
      desc = 'LazyGit Log (current file)',
    },
    {
      '<leader>gl',
      function()
        Snacks.lazygit.log()
      end,
      desc = 'LazyGit Log',
    },
    {
      '<leader>gb',
      function()
        Snacks.git.blame_line()
      end,
      desc = 'Git Blame Line',
    },
    {
      '<leader>gB',
      function()
        Snacks.gitbrowse()
      end,
      desc = 'Git Browse',
    },
  },
}
