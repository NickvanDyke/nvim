return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim' },
  opts = {
    settings = {
      save_on_toggle = true,
    },
  },
  keys = {
    {
      '<leader>a',
      function()
        require('harpoon'):list():add()
      end,
      desc = 'Add file to harpoon',
    },
    {
      '<leader>h',
      function()
        require('harpoon').ui:toggle_quick_menu(require('harpoon'):list())
      end,
      desc = 'Toggle harpoon menu',
    },
    {
      '<C-1>',
      function()
        require('harpoon'):list():select(1)
      end,
      desc = 'Navigate to file 1',
    },
    {
      '<C-2>',
      function()
        require('harpoon'):list():select(2)
      end,
      desc = 'Navigate to file 2',
    },
    {
      '<C-3>',
      function()
        require('harpoon'):list():select(3)
      end,
      desc = 'Navigate to file 3',
    },
    {
      '<C-4>',
      function()
        require('harpoon'):list():select(4)
      end,
      desc = 'Navigate to file 4',
    },
    {
      '<C-5>',
      function()
        require('harpoon'):list():select(5)
      end,
      desc = 'Navigate to file 5',
    },
    {
      '<C-S-P>',
      function()
        require('harpoon'):list():prev()
      end,
      desc = 'Navigate to previous file in harpoon list',
    },
    {
      '<C-S-N>',
      function()
        require('harpoon'):list():next()
      end,
      desc = 'Navigate to next file in harpoon list',
    },
  },
}
