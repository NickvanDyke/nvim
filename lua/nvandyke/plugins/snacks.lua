return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  opts = {
    -- explorer = {},
    scope = {},
    indent = {},
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
    lazygit = {
      enabled = true,
      -- https://github.com/folke/snacks.nvim/issues/46
      -- Change default settings to open edits in the current tab, not a new one
      config = {
        os = {
          edit = '[ -z "$NVIM" ] && (nvim -- {{filename}}) || (nvim --server "$NVIM" --remote-send "q" && nvim --server "$NVIM" --remote {{filename}})',
          editAtLine = '[ -z "$NVIM" ] && (nvim +{{line}} -- {{filename}}) || (nvim --server "$NVIM" --remote-send "q" &&  nvim --server "$NVIM" --remote {{filename}} && nvim --server "$NVIM" --remote-send ":{{line}}<CR>")',
          editAtLineAndWait = 'nvim +{{line}} {{filename}}',
          openDirInEditor = '[ -z "$NVIM" ] && (nvim -- {{dir}}) || (nvim --server "$NVIM" --remote-send "q" && nvim --server "$NVIM" --remote {{dir}})',
        },
      },
    },
    -- NOTE: Breaks and issues tons of warnings in VSCode Neovim
    words = { enabled = true },
    statuscolumn = { enabled = false },
    notifier = { -- Used by noice
      top_down = false,
      style = 'compact',
    },
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
