return {
  'folke/snacks.nvim',
  -- dependencies = { 'folke/persistence.nvim' },
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
      -- TODO: how to disable this? Don't need with prompt
      winbar = nil,
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
    {
      '<leader>S',
      function()
        Snacks.scratch.select()
      end,
      desc = 'Select Scratch Buffer',
    },
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
      '<C-\\>',
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
      desc = 'Lazy[d]ocker',
    },
    {
      '<leader>gg',
      function()
        Snacks.lazygit.open()
      end,
      desc = 'Lazy[g]it',
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
  init = function()
    vim.api.nvim_create_autocmd('User', {
      pattern = 'VeryLazy',
      callback = function()
        -- Setup some globals for debugging (lazy-loaded)
        _G.dd = function(...)
          Snacks.debug.inspect(...)
        end
        _G.bt = function()
          Snacks.debug.backtrace()
        end
        vim.print = _G.dd -- Override print to use snacks for `:=` command

        -- Create some toggle mappings
        Snacks.toggle.option('spell', { name = 'Spelling' }):map '<leader>uS'
        Snacks.toggle.option('wrap', { name = 'Wrap' }):map '<leader>uw'
        Snacks.toggle.option('relativenumber', { name = 'Relative Number' }):map '<leader>uL'
        Snacks.toggle.diagnostics():map '<leader>ud'
        Snacks.toggle.line_number():map '<leader>ul'
        Snacks.toggle.option('conceallevel', { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 }):map '<leader>uc'
        Snacks.toggle.treesitter():map '<leader>uT'
        Snacks.toggle.option('background', { off = 'light', on = 'dark', name = 'Dark Background' }):map '<leader>ub'
        Snacks.toggle.inlay_hints():map '<leader>uh'
        Snacks.toggle.indent():map '<leader>ug'
        Snacks.toggle.dim():map '<leader>uD'
        Snacks.toggle.scroll():map '<leader>us'
      end,
    })
  end,
}
