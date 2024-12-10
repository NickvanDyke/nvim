return {
  'CopilotC-Nvim/CopilotChat.nvim',
  dependencies = {
    { 'zbirenbaum/copilot.lua' },
    { 'nvim-lua/plenary.nvim' }, -- for curl, log wrapper
  },
  -- build = 'make tiktoken', -- Only on MacOS or Linux
  opts = {
    window = {
      layout = 'float',
      border = vim.g.border_default,
    },
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
      mode = { 'n', 'x' },
      '<leader>cc',
      function()
        require('CopilotChat').toggle()
      end,
      desc = 'CopilotChat'
    },
  },
  init = function()
    vim.cmd [[cab cc CopilotChat]]
  end,
}
