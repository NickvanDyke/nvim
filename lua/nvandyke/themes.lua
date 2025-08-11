return vim.tbl_map(function(theme)
  return { theme, lazy = true }
end, {
  'rose-pine/neovim',
  'folke/tokyonight.nvim',
  'projekt0n/github-nvim-theme',
  'catppuccin/nvim',
  'sainnhe/everforest',
  'webhooked/kanso.nvim',
  'ellisonleao/gruvbox.nvim',
})
