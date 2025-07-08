return {
  'folke/flash.nvim',
  opts = {
    label = {
      rainbow = {
        enabled = true,
      },
    },
    modes = {
      char = {
        jump_labels = true,
      },
      treesitter = {
        -- This breaks the `treesitter` mode's selection
        -- jump = { pos = 'start' },
      },
    },
    prompt = {
      enabled = false, -- looks bad until it properly supports the new vim.o.winborder
    },
  },
  keys = {
    -- TODO: have to wait for timeoutlen when using `ys` or `yS` because of nvim-surround `ys` mapping
    {
      's',
      mode = { 'n', 'o' },
      function()
        require('flash').jump()
      end,
      desc = 'Flash',
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
      'S',
      -- No 'x' mode because it conflicts with nvim-surround and seems kinda useless anyway (maybe I'm using it wrong)
      mode = { 'n', 'o' },
      function()
        require('flash').treesitter()
      end,
      desc = 'Flash Treesitter',
    },
    {
      'R',
      mode = { 'n', 'o', 'x' },
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
