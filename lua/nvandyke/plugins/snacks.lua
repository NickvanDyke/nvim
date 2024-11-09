return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  opts = {
    bigfile = { enabled = true },
    terminal = {
      enabled = true,
    },
    lazygit = { enabled = true },
    words = { enabled = true },
    statuscolumn = { enabled = false }, -- tf, is everything enabled by default?
    notifier = { enabled = false },
    styles = {
      terminal = {
        bo = {
          filetype = 'snacks_terminal',
        },
        wo = {},
        keys = {
          gf = function(self)
            local f = vim.fn.findfile(vim.fn.expand '<cfile>')
            if f == '' then
              Snacks.notify.warn 'No file under cursor'
            else
              self:close()
              vim.cmd('e ' .. f)
            end
          end,
          term_normal = {
            '<esc>',
            function(self)
              self.esc_timer = self.esc_timer or (vim.uv or vim.loop).new_timer()
              if self.esc_timer:is_active() then
                self.esc_timer:stop()
                vim.cmd 'stopinsert'
              else
                self.esc_timer:start(200, 0, function() end)
                return '<esc>'
              end
            end,
            mode = 't',
            expr = true,
            desc = 'Double escape to normal mode',
          },
        },
      },
    },
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
      desc = 'LazyGit current file',
    },
  },
}
