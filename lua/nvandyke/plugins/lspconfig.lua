return {
  'neovim/nvim-lspconfig',
  event = 'BufReadPre',
  dependencies = {
    'mason-org/mason.nvim',
  },
  keys = {
    {
      '<leader>F',
      function()
        vim.cmd('silent! LspEslintFixAll')
      end,
      desc = 'Fix all'
    }
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
      -- WARNING: `eslint` needs to exist in `node_modules` or globally installed.
      -- Doesn't seem to cooperate with yarn v4 cache.
      'eslint',
    }

    -- vim.api.nvim_create_autocmd('BufWritePre', {
    --   pattern = { '*.js', '*.ts', '*.jsx', '*.tsx' },
    --   command = 'LspEslintFixAll',
    -- })
  end,
}
