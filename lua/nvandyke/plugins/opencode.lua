return {
  'NickvanDyke/opencode.nvim',
  dir = '~/dev/opencode.nvim',
  dependencies = {
    'folke/snacks.nvim',
  },
  ---@type opencode.Config
  opts = {
    auto_focus = false,
    auto_insert = true, -- overriding from my snacks-terminal opts
    -- Example context integration
    context = {
      ---@param prompt string
      ---@return string|nil
      grapple = function(prompt)
        if not prompt:match '@grapple' then
          return nil
        end

        local paths = {}
        for _, tag in ipairs(require('grapple').tags() or {}) do
          table.insert(paths, tag.path)
        end
        return table.concat(paths, '\n')
      end,
    },
  },
  -- stylua: ignore
  keys = {
    -- opencode.nvim exposes a general, flexible API.
    -- I recommend you compose it according to your preferences.
    -- But here are some examples to get you started :)
    { '<leader>ot', function() require('opencode').toggle() end, desc = 'Toggle opencode', },
    { '<leader>oa', function() require('opencode').ask() end, desc = 'Ask opencode', mode = { 'n', 'v' }, },
    { '<leader>oA', function() require('opencode').ask('@file ') end, desc = 'Ask opencode about current file', mode = { 'n', 'v' }, },
    -- Commands
    { '<leader>on', function() require('opencode').command('/new') end, desc = 'New session', },
    -- Prompts
    { '<leader>oe', function() require('opencode').send('Explain this code') end, desc = 'Explain selection', mode = 'v', },
    { '<leader>oo', function() require('opencode').send('Optimize this code for performance and readability') end, desc = 'Optimize selection', mode = 'v', },
    { '<leader>od', function() require('opencode').send('Add documentation comments to this code') end, desc = 'Document selection', mode = 'v', },
    { '<leader>or', function() require('opencode').send('Review @file for correctness and readability') end, desc = 'Review file', },
    { '<leader>of', function() require('opencode').send('Fix these @diagnostics') end, desc = 'Fix errors in file', },
  },
}
