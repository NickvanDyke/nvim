return {
  'Goose97/timber.nvim',
  event = 'BufReadPost',
  opts = {
    log_templates = {
      default = {
        lua = [[vim.print("%log_target", %log_target)]],
      },
    },
  },
}
