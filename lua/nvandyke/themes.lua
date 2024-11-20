return {
  'lmantw/themify.nvim',

  lazy = false,
  priority = 999,

  config = function()
    require('themify').setup {
      'diegoulloao/neofusion.nvim',
      { 'rose-pine/neovim', blacklist = { 'rose-pine' } },
      'vague2k/vague.nvim',
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
      { 'projekt0n/github-nvim-theme', whitelist = { 'github_dark', 'github_dark_default' } },
      { 'catppuccin/nvim', whitelist = { 'catppuccin-frappe', 'catppuccin-mocha', 'catppuccin-latte' } },
    }

    vim.keymap.set('n', '<leader>tt', '<cmd>Themify<CR>', { desc = '[T]oggle [T]heme' })
  end,
}
