return {
  'CopilotC-Nvim/CopilotChat.nvim',
  dependencies = {
    { 'zbirenbaum/copilot.lua' },
    { 'nvim-lua/plenary.nvim' }, -- for curl, log wrapper
  },
  -- build = 'make tiktoken', -- Only on MacOS or Linux
  opts = {
    -- See Configuration section for options
  },
  cmd = { 'CopilotChat' },
  keys = {
    -- Show prompts actions with telescope
    -- {
    --   '<leader>ccp',
    --   function()
    --     local actions = require 'CopilotChat.actions'
    --     require('CopilotChat.integrations.telescope').pick(actions.prompt_actions())
    --   end,
    --   desc = 'CopilotChat - Prompt actions',
    -- },
    {
      '<C-c>',
      function()
        require('CopilotChat').toggle()
      end,
    },
  },
  init = function()
    vim.cmd [[cab cc CopilotChat]]
  end,
}
