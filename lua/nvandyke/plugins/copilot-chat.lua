return {
  'CopilotC-Nvim/CopilotChat.nvim',
  enabled = false,
  dependencies = {
    { 'zbirenbaum/copilot.lua' },
    { 'nvim-lua/plenary.nvim' }, -- for curl, log wrapper
  },
  build = 'make tiktoken', -- Only on MacOS or Linux
  opts = {
    window = {
      -- layout = 'float',
      -- width = 0.69,
      -- height = 0.69,
    },
    prompts = {},
  },
  cmd = { 'CopilotChat' },
  keys = {
    {
      '<leader>cc',
      function()
        require('CopilotChat').toggle()
      end,
      mode = { 'n', 'x' },
      desc = 'CopilotChat',
    },
    {
      '<leader>cp',
      function()
        require('CopilotChat').select_prompt()
      end,
      mode = { 'n', 'x' },
      desc = 'CopilotChat Prompts',
    },
  },
  init = function()
    vim.opt.completeopt = { 'popup' }
    vim.cmd [[cab cc CopilotChat]]
  end,
}
