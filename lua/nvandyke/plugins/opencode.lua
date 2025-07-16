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
    -- Example keymaps
    { '<leader>ot', function() require('opencode').toggle() end, desc = 'Toggle opencode', },
    { '<leader>oa', function() require('opencode').ask() end, desc = 'Ask opencode', mode = { 'n', 'v' }, },
    -- Example commands
    { '<leader>on', function() require('opencode').command('/new') end, desc = 'New opencode session', },
    -- Example prompts
    { '<leader>oe', function() require('opencode').send('Explain this code') end, desc = 'Explain selected code', mode = 'v', },
    { '<leader>oc', function() require('opencode').send('Critique @file for correctness and readability') end, desc = 'Critique current file', },
    { '<leader>od', function() require('opencode').send('Fix these @diagnostics') end, desc = 'Fix current file errors', },
    -- { '<leader>of', function() require('opencode').send('Fix the @diagnostics under @cursor') end, desc = 'Fix errors under cursor', },
  },
}
