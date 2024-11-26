return {
  'OlegGulevskyy/better-ts-errors.nvim',
  enabled = false,
  dependencies = { 'MunifTanjim/nui.nvim' },
  config = {
    keymaps = {
      toggle = '<leader>dd', -- default '<leader>dd'
      go_to_definition = '<leader>dx', -- default '<leader>dx'
    },
  },
}
