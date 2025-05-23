return {
  'GeorgesAlkhouri/nvim-aider',
  enabled = true,
  cmd = 'Aider',
  dependencies = { 'folke/snacks.nvim' },
  keys = {
    { '<leader>at', '<cmd>Aider toggle<cr>', desc = 'Toggle Aider' },
    { '<leader>as', '<cmd>Aider send<cr>', desc = 'Send to Aider', mode = { 'n', 'v' } },
    { '<leader>ac', '<cmd>Aider command<cr>', desc = 'Aider Commands' },
    { '<leader>ab', '<cmd>Aider buffer<cr>', desc = 'Send Buffer' },
    { '<leader>aa', '<cmd>Aider add<cr>', desc = 'Add File' },
    { '<leader>ad', '<cmd>Aider drop<cr>', desc = 'Drop File' },
    { '<leader>ar', '<cmd>Aider add readonly<cr>', desc = 'Add Read-Only' },
    { '<leader>aR', '<cmd>Aider reset<cr>', desc = 'Reset Session' },
  },
  opts = {
    auto_reload = true,
    args = {
      '--no-auto-commits',
      '--dark-mode',
      -- '--code-theme material',
    },
    picker_cfg = {
      preset = 'select',
    },
  },
}
