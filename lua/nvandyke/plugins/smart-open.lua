return {
  'danielfalk/smart-open.nvim',
  keys = {
    {
      '<leader><leader>',
      function()
        require('telescope').extensions.smart_open.smart_open {}
      end,
      desc = 'Smart Open',
    },
  },
  config = function()
    require('telescope').load_extension 'smart_open'
  end,
  dependencies = {
    'kkharji/sqlite.lua',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  },
}
