return {
  'neovim/nvim-lspconfig',
  dependencies = {
    'williamboman/mason.nvim',
  },
  config = function()
    -- Add installed executables to PATH
    require('mason').setup()

    -- Extend lspconfig defaults
    -- Atm it doesn't support merging with lsp/<server>.lua

    -- https://writewithharper.com/docs/integrations/neovim
    vim.lsp.config('harper_ls', {
      filetypes = { 'markdown' },
      settings = {
        ['harper-ls'] = {
          linters = {
            -- SentenceCapitalization = false,
            SpellCheck = false,
          },
        },
      },
    })

    vim.lsp.config('yamlls', {
      settings = {
        yaml = {
          schemas = {
            ['https://json.schemastore.org/circleciconfig.json'] = '/.circleci/config.yml',
          },
        },
      },
    })

    vim.lsp.enable {
      'lua_ls',
      'graphql',
      'terraformls',
      'intelephense',
      'cssls',
      'volar',
      'basedpyright',
      'yamlls',
      'circleci',
      'harper_ls',
      -- NOTE: `eslint` needs to exist in `node_modules` or globally installed.
      -- Doesn't seem to cooperate with yarn v4 cache.
      'eslint',
    }
  end,
}
