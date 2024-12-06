return {
  'danielfalk/smart-open.nvim',
  keys = {
    {
      '<leader><leader>',
      function()
        require('telescope').extensions.smart_open.smart_open {
          path_display = { 'smart' },
          filename_first = false,
        }
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
