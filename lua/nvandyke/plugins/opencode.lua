return {
  'NickvanDyke/opencode.nvim',
  dir = '~/dev/opencode.nvim',
  dependencies = {
    'folke/snacks.nvim',
  },
  opts = {
    auto_insert = true, -- overriding from snacks-terminal
  },
  keys = {
    {
      '<leader>ot',
      function()
        require('opencode').toggle()
      end,
      desc = 'Toggle opencode',
    },
    {
      '<leader>oa',
      function()
        require('opencode').ask()
      end,
      desc = 'Ask opencode',
      mode = { 'n', 'v' },
    },
    -- Example re-usable prompts
    {
      '<leader>oe',
      function()
        require('opencode').ask 'Explain this code'
      end,
      desc = 'Explain selected code',
      mode = 'v',
    },
    {
      '<leader>oc',
      function()
        require('opencode').ask 'Critique @file for correctness and readability'
      end,
      desc = 'Critique current file',
      mode = 'n',
    },
  },
}
