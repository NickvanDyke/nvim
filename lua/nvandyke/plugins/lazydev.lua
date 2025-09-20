return {
  -- `lazydev` configures Lua LSP for your Neovim config, runtime and plugins
  -- used for completion, annotations and signatures of Neovim apis
  'folke/lazydev.nvim',
  enabled = false, -- Doesn't work with emmylua_ls I think
  ft = 'lua',
  dependencies = {
    'Bilal2453/luvit-meta',
  },
  opts = {
    library = {
      -- Load luvit types when the `vim.uv` word is found
      { path = 'luvit-meta/library', words = { 'vim%.uv' } },
      { path = 'snacks.nvim', words = { 'Snacks' } },
      { path = 'lazy.nvim', words = { 'LazyVim' } },
    },
  },
}
