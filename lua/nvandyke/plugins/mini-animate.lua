return {
  'echasnovski/mini.animate',
  version = false,
  -- To make pair programming easier to follow
  keys = {
    {
      '<leader>ta',
      function()
        vim.g.minianimate_disable = not vim.g.minianimate_disable
      end,
      noremap = true,
      silent = true,
      desc = '[T]oggle [A]nimations',
    },
  },
  config = function()
    vim.g.minianimate_disable = true -- it'll get immediately toggled on first run
    require('mini.animate').setup()
  end,
}
