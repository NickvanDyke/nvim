return {
  'GeorgesAlkhouri/nvim-aider',
  cmd = 'Aider',
  dependencies = { 'folke/snacks.nvim' },
  keys = {
    { '<leader>at', '<cmd>Aider toggle<cr>', desc = 'Toggle Aider' },
    { '<leader>as', '<cmd>Aider send<cr>', desc = 'Send to Aider', mode = { 'n', 'v' } },
    { '<leader>ac', '<cmd>Aider command<cr>', desc = 'Aider Commands' },
    { '<leader>ab', '<cmd>Aider buffer<cr>', desc = 'Send Buffer' },
    { '<leader>a+', '<cmd>Aider add<cr>', desc = 'Add File' },
    { '<leader>a-', '<cmd>Aider drop<cr>', desc = 'Drop File' },
    { '<leader>ar', '<cmd>Aider add readonly<cr>', desc = 'Add Read-Only' },
    { '<leader>aR', '<cmd>Aider reset<cr>', desc = 'Reset Session' },
    {
      '<leader>aG',
      function()
        for _, tag in ipairs(require('grapple').tags() or {}) do
          require('nvim_aider').api.add_file(tag.path)
        end
      end,
      desc = 'Add Grapple Files',
    },
  },
  opts = {
    auto_reload = true,
    args = {
      '--no-auto-commits',
      vim.o.background == 'dark' and '--dark-mode',
      '--code-theme=material',
    },
    picker_cfg = {
      preset = 'select',
    },
  },
}
