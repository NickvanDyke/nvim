return {
  'stevearc/aerial.nvim',
  -- Optional dependencies
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'nvim-tree/nvim-web-devicons',
  },
  keys = {
    {
      '<leader>a',
      '<cmd>AerialToggle!<CR>',
      mode = 'n',
      desc = 'Aerial',
    },
  },
  opts = {
    attach_mode = 'global',
    backends = { 'lsp', 'treesitter', 'markdown', 'asciidoc', 'man' },
    filter_kind = false, -- wtf still sucks

    -- optionally use on_attach to set keymaps when aerial has attached to a buffer
    on_attach = function(bufnr)
      -- Jump forwards/backwards with '{' and '}'
      vim.keymap.set('n', '{', '<cmd>AerialPrev<CR>', { buffer = bufnr })
      vim.keymap.set('n', '}', '<cmd>AerialNext<CR>', { buffer = bufnr })
    end,
  },
}
