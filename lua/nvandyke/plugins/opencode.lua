return {
  'NickvanDyke/opencode.nvim',
  -- dir = '~/dev/opencode.nvim',
  dependencies = {
    'folke/snacks.nvim',
  },
  ---@type opencode.Config
  opts = {
    -- Example context integration
    context = {
      ---@return string|nil
      ['@grapple'] = function()
        local tags = require('grapple').tags()
        if not tags or #tags == 0 then
          return nil
        end

        local paths = {}
        for _, tag in ipairs(tags) do
          table.insert(paths, tag.path)
        end
        return table.concat(paths, ', ')
      end,
    },
  },
  -- stylua: ignore
  keys = {
    -- opencode.nvim exposes a general, flexible API — customize it to your workflow!
    -- But here are some examples to get you started :)
    {
      '<leader>ot',
      function()
        require('snacks.terminal').toggle('opencode', {
          win = {
            position = 'right',
          }
        })
      end,
      desc = "Toggle opencode",
    },
    { '<leader>oa', function() require('opencode').ask() end, desc = 'Ask opencode', mode = { 'n', 'v' }, },
    { '<leader>oA', function() require('opencode').ask('@file ') end, desc = 'Ask opencode about current file', mode = { 'n', 'v' }, },
    { '<leader>on', function() require('opencode').command('/new') end, desc = 'New session', },
    { '<leader>oe', function() require('opencode').prompt('Explain @cursor and its context') end, desc = 'Explain code near cursor' },
    { '<leader>or', function() require('opencode').prompt('Review @file for correctness and readability') end, desc = 'Review file', },
    { '<leader>of', function() require('opencode').prompt('Fix these @diagnostics') end, desc = 'Fix errors', },
    { '<leader>oo', function() require('opencode').prompt('Optimize @selection for performance and readability') end, desc = 'Optimize selection', mode = 'v', },
    { '<leader>od', function() require('opencode').prompt('Add documentation comments for @selection') end, desc = 'Document selection', mode = 'v', },
    { '<leader>ot', function() require('opencode').prompt('Add tests for @selection') end, desc = 'Test selection', mode = 'v', },
  },
  init = function()
    -- vim.api.nvim_create_autocmd('DiagnosticChanged', {
    --   callback = function(args)
    --     local diagnostics = vim.diagnostic.get(args.buf)
    --     if #diagnostics > 0 then
    --       require('opencode').prompt 'Fix these @diagnostics'
    --     end
    --   end,
    -- })
  end,
}
