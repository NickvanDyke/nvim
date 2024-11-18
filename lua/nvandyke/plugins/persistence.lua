return {
  'folke/persistence.nvim',
  event = 'BufReadPre', -- this will only start session saving when an actual file was opened
  config = function()
    require('persistence').setup()

    vim.api.nvim_create_autocmd('User', {
      desc = 'Load arrow files',
      pattern = 'PersistenceLoadPost',
      callback = function()
        require('arrow.git').refresh_git_branch() -- only if separated_by_branch is true
        require('arrow.persist').load_cache_file()
      end,
    })
  end,
}
