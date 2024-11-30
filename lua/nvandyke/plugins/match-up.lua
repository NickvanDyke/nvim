return {
  'andymass/vim-matchup',
  event = 'BufReadPost',
  opts = {},
  init = function ()
    -- vim.g.matchup_matchparen_offscreen = { method = 'popup' }
    -- Sometimes conflicts with treesitter-context
  end
}
