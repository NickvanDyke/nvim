-- Technically we can configure LSPs ourselves more easily now with Neovim 0.11
-- But Mason as a portable package manager is nice.
-- And lspconfig saves a lot of boilerplate and maintenance.
return {
  'williamboman/mason.nvim',
  cmd = { 'LspInfo', 'LspStart', 'LspRestart', 'Mason' },
  event = 'BufReadPre',
  dependencies = {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    'williamboman/mason-lspconfig.nvim',
    'neovim/nvim-lspconfig',
  },
  config = function()
    -- Enable the following language servers
    --  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
    --
    --  Add any additional override configuration in the following tables. Available keys are:
    --  - cmd (table): Override the default command used to start the server
    --  - filetypes (table): Override the default list of associated filetypes for the server
    --  - capabilities (table): Override fields in capabilities. Can be used to disable certain LSP features.
    --  - settings (table): Override the default settings passed when initializing the server.
    --        For example, to see the options for `lua_ls`, you could go to: https://luals.github.io/wiki/settings/
    local servers = {
      lua_ls = {
        -- cmd = {...},
        -- filetypes = { ...},
        -- capabilities = {},
        settings = {
          Lua = {
            completion = {
              callSnippet = 'Replace',
            },
            -- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
            -- diagnostics = { disable = { 'missing-fields' } },
          },
        },
      },

      graphql = {},
      terraformls = {},
      intelephense = {},
      cssls = {},
      volar = {},
      basedpyright = {},

      ['circleci-yaml-language-server'] = {
        cmd = { 'circleci-yaml-language-server', '--stdio' },
        filetypes = { 'yaml' },
        root_markers = { '.circleci/config.yml' },
      },
      ['yaml-language-server'] = {
        settings = {
          yaml = {
            schemas = {
              ['https://json.schemastore.org/circleciconfig.json'] = '/.circleci/config.yml',
            },
          },
        },
      },
      harper_ls = {
        filetypes = { 'markdown' },
      },
    }

    require('mason').setup()

    local ensure_installed = vim.tbl_keys(servers or {})
    vim.list_extend(ensure_installed, {
      'stylua',
      'black',
    })

    -- mason-lspconfig provides this too, but then it also calls setup for the LSP
    -- via nvim-lspconfig. Which doesn't have some of them (like stylua or circleci)
    -- and thus will error.
    -- TODO: doesn't seem to do anything when I add a new entry?
    require('mason-tool-installer').setup { ensure_installed = ensure_installed }

    require('mason-lspconfig').setup {
      handlers = {
        function(server_name)
          local server = servers[server_name] or {}
          require('lspconfig')[server_name].setup(server)
        end,
      },
    }

    -- lspconfig doesn't support circleci, so set it up ourselves
    vim.lsp.config['circleci'] = servers['circleci-yaml-language-server']
    vim.lsp.enable 'circleci'
  end,
}
