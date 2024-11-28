return {
  'stevearc/dressing.nvim',
  opts = {
    select = {
      relative = 'editor',
      telescope = require('telescope.themes').get_dropdown {
        layout_config = {
          -- width = 0.5,
        },
      },
    },
  },
}
