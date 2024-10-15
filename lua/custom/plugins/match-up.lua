return {
  'andymass/vim-matchup',
  opts = {},
  config = function ()
    vim.g.matchup_matchparen_offscreen = { method = 'popup' }
  end
}
