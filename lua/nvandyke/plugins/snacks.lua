return {
  'folke/snacks.nvim',
  priority = 1000,
  opts = {
    bigfile = { enabled = true },
    terminal = {
      enabled = true,
    },
    statuscolumn = { enabled = false }, -- tf, is everything enabled by default?
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
      '<leader>lg',
      function()
        Snacks.terminal 'lazygit'
      end,
      desc = '[L]azy [G]it',
    },
    {
      '<leader>ld',
      function()
        Snacks.terminal 'lazydocker'
      end,
      desc = '[L]azy [D]ocker',
    },
  },
}
