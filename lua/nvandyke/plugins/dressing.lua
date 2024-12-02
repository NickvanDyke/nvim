return {
  'stevearc/dressing.nvim',
  opts = {
    select = {
      -- We use telescope-ui-select. Easier to configure and it seems to more easily override other uses, like code_action.
      enabled = false,
    },
    input = {
      mappings = {
        n = {
          q = 'Close',
        },
      },
    },
  },
}
