return {
  'folke/snacks.nvim',
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
        -- Snacks.toggle.option('spell', { name = 'Spelling' }):map '<leader>uS'
        Snacks.toggle.option('wrap', { name = 'Wrap' }):map '<leader>uw'
        Snacks.toggle.option('relativenumber', { name = 'Relative Number' }):map '<leader>uL'
        Snacks.toggle.diagnostics():map '<leader>uD'
        Snacks.toggle.line_number():map '<leader>ul'
        Snacks.toggle.option('conceallevel', { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 }):map '<leader>uc'
        Snacks.toggle.treesitter():map '<leader>uT'
        Snacks.toggle.option('background', { off = 'light', on = 'dark', name = 'Dark Background' }):map '<leader>ub'
        Snacks.toggle.inlay_hints():map '<leader>uh'
        Snacks.toggle.indent():map '<leader>ug'
        Snacks.toggle.dim():map '<leader>ud'
        Snacks.toggle.scroll():map '<leader>us'
        Snacks.toggle
          .new({
            id = 'autoformat',
            name = 'Autoformat',
            get = function()
              return not vim.g.disable_autoformat
            end,
            set = function(state)
              vim.g.disable_autoformat = not state
            end,
          })
          :map '<leader>uf'
        Snacks.toggle
          .new({
            id = 'smear_cursor',
            name = 'Smear Cursor',
            get = function()
              return require('smear_cursor').enabled
            end,
            set = function(state)
              require('smear_cursor').enabled = state
            end,
          })
          :map '<leader>uS'
        Snacks.toggle
          .new({
            id = 'screenkey',
            name = 'Screenkey',
            get = function()
              return require('screenkey').is_active()
            end,
            set = function(state)
              require('screenkey').toggle()
            end,
          })
          :map '<leader>uK'
        Snacks.toggle
          .new({
            name = 'Pairing',
            get = function()
              return Snacks.toggle.scroll():get() and Snacks.toggle.line_number():get() and Snacks.toggle.get('smear_cursor'):get() and vim.o.cursorline
            end,
            set = function(state)
              Snacks.toggle.scroll():set(state)
              Snacks.toggle.line_number():set(state)
              Snacks.toggle.get('smear_cursor'):set(state)
              vim.o.cursorline = state
            end,
          })
          :map '<leader>up'
      end,
    })
  end,
}
