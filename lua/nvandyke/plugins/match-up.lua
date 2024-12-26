return {
  'andymass/vim-matchup',
  event = 'BufReadPost',
  opts = {},
  init = function ()
    vim.g.matchup_matchparen_offscreen = { method = 'status_manual' }
  end
}
