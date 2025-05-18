return {
  'GeorgesAlkhouri/nvim-aider',
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
    picker_cfg = {
      preset = 'select',
    },
    -- TODO: Do these do anything...? Completion bg color is really gross
    theme = {
      user_input_color = '#a6da95',
      tool_output_color = '#8aadf4',
      tool_error_color = '#ed8796',
      tool_warning_color = '#eed49f',
      assistant_output_color = '#c6a0f6',
      completion_menu_color = '#cad3f5',
      completion_menu_bg_color = '#24273a',
      completion_menu_current_color = '#181926',
      completion_menu_current_bg_color = '#f4dbd6',
    },
  },
}
