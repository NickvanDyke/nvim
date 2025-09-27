return {
  'NickvanDyke/opencode.nvim',
  dir = '~/dev/opencode.nvim',
  dependencies = {
    { 'folke/snacks.nvim' },
  },
  -- stylua: ignore
  config = function()
    vim.g.opencode_opts = {
      prompts = {
        joke = {
          description = 'Personify as cat',
          prompt = 'Personify @buffer as a cat and write a one-paragraph story about it.',
        },
      },
      terminal = {
        auto_insert = true,
        win = {
          -- keys = {
          --   win_right = {
          --     '<M-h>',
          --     function()
          --       vim.cmd 'wincmd h'
          --     end,
          --     -- mode = { 'n', 't' },
          --     -- desc = 'Window: navigate right',
          --   },
          -- },
          position = 'left',
        },
      },
    }

    -- Required for `opts.auto_reload`
    vim.opt.autoread = true

    -- Recommended keymaps
    vim.keymap.set('n', '<leader>ot', function() require('opencode').toggle() end, { desc = 'Toggle opencode' })
    vim.keymap.set('n', '<leader>oA', function() require('opencode').ask() end, { desc = 'Ask opencode' })
    vim.keymap.set('n', '<leader>oa', function() require('opencode').ask('@cursor: ') end, { desc = 'Ask opencode about this' })
    vim.keymap.set('v', '<leader>oa', function() require('opencode').ask('@selection: ') end, { desc = 'Ask opencode about selection' })
    vim.keymap.set('n', '<leader>o+', function() require('opencode').append_prompt('@buffer') end, { desc = 'Add buffer to prompt' })
    vim.keymap.set('v', '<leader>o+', function() require('opencode').append_prompt('@selection') end, { desc = 'Add selection to prompt' })
    vim.keymap.set('n', '<leader>os', function() require('opencode').select() end, { desc = 'Select opencode prompt' })
    vim.keymap.set('n', '<leader>on', function() require('opencode').command('session_new') end, { desc = 'New session' })
    vim.keymap.set('n', '<leader>oy', function() require('opencode').command('messages_copy') end, { desc = 'Copy last opencode message' })
    vim.keymap.set('n', '<S-C-u>',    function() require('opencode').command('messages_half_page_up') end, { desc = 'Messages half page up' })
    vim.keymap.set('n', '<S-C-d>',    function() require('opencode').command('messages_half_page_down') end, { desc = 'Messages half page down' })
    -- Example: keymap for custom prompt
    vim.keymap.set('n', '<leader>oe', function() require('opencode').prompt('Explain @cursor and its context', { append_only = true }) end, { desc = 'Explain code near cursor' })

  end,
}
