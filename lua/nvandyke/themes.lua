return {
  'lmantw/themify.nvim',

  lazy = false,
  priority = 999,

  config = function()
    require('themify').setup {
      'rose-pine/neovim',
      'vague2k/vague.nvim',
      { 'overcache/NeoSolarized', branch = 'master' },
      { 'folke/tokyonight.nvim', whitelist = { 'tokyonight-moon', 'tokyonight-night', 'tokyonight-storm' } },
      {
        'ellisonleao/gruvbox.nvim',
        before = function()
          require('gruvbox').setup {
            overrides = {
              -- https://github.com/ellisonleao/gruvbox.nvim/issues/304
              NormalFloat = { bg = '#32302f' },
              GitSignsAdd = { link = 'GruvboxGreenSign' },
              GitSignsChange = { link = 'GruvboxOrangeSign' },
              GitSignsDelete = { link = 'GruvboxRedSign' },
            },
          }
        end,
      },
      'projekt0n/github-nvim-theme',
      { 'catppuccin/nvim', whitelist = { 'catppuccin-mocha', 'catppuccin-latte' } },
    }

    vim.keymap.set('n', '<leader>tt', '<cmd>Themify<CR>', { desc = '[T]oggle [T]heme' })
  end,
}
