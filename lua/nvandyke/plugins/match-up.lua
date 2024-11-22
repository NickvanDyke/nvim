return {
  'andymass/vim-matchup',
  event = 'BufEnter',
  opts = {},
  config = function ()
    vim.g.matchup_matchparen_offscreen = { method = 'popup' }
  end
}
