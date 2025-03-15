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
      width = 0.69,
      height = 0.69,
      border = vim.g.border_default,
    },
    -- See Configuration section for options
  },
  cmd = { 'CopilotChat' },
  keys = {
    {
      mode = { 'n', 'x' },
      '<leader>cc',
      function()
        require('CopilotChat').toggle()
      end,
      desc = 'CopilotChat',
    },
  },
  init = function()
    vim.cmd [[cab cc CopilotChat]]
  end,
}
