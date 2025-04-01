return {
  'folke/flash.nvim',
  ---@type Flash.Config
  opts = {
    label = {
      rainbow = {
        enabled = true,
      },
    },
    modes = {
      char = {
        keys = { 'f', 'F', 't', 'T' },
      },
      treesitter = {
        jump = { pos = 'start' },
      },
      search = {
        -- enabled = true,
      },
    },
  },
  keys = {
    -- TODO: have to wait for timeoutlen when using `ys` or `yS` because of nvim-surround `ys` mapping
    {
      's',
      mode = { 'n', 'x', 'o' },
      function()
        require('flash').jump()
      end,
      desc = 'Flash',
    },
    {
      'S',
      -- No 'x' mode because it conflicts with nvim-surround and seems kinda useless anyway (maybe I'm using it wrong)
      mode = { 'n', 'o' },
      function()
        require('flash').treesitter()
      end,
      desc = 'Flash Treesitter',
    },
    {
      'r',
      mode = 'o',
      function()
        require('flash').remote()
      end,
      desc = 'Remote Flash',
    },
    {
      'R',
      mode = { 'o', 'x' },
      function()
        require('flash').treesitter_search()
      end,
      desc = 'Treesitter Search',
    },
    -- '/',
    -- '?',
    'f',
    'F',
    't',
    'T',
  },
}
