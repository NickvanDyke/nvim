return {
  'folke/persistence.nvim',
  opts = {
    -- need = 0,
  },
  config = function(_, opts)
    require('persistence').setup(opts)

    -- Remove 'blank' from the default setting to ignore snacks explorer, notifications history, etc. otherwise they restore empty
    vim.o.sessionoptions = vim.o.sessionoptions:gsub('blank,', '')
  end,
}
