return {
  'neovim/nvim-lspconfig',
  dependencies = {
    {
      'williamboman/mason.nvim',
      -- Call setup to add installed executables to PATH
      opts = {},
    },
    {
      'WhoIsSethDaniel/mason-tool-installer.nvim',
      opts = {
        ensure_installed = {
          'lua-language-server',
          'graphql-language-service-cli',
          'terraform-ls',
          'intelephense',
          'css-lsp',
          'vue-language-server',
          'basedpyright',
          'circleci-yaml-language-server',
          'yaml-language-server',
          'harper-ls',
          'stylua',
          'black',
        },
      },
    },
    {
      'Massolari/lsp-auto-setup.nvim',
      opts = {},
    },
  },
  config = function()
    -- Not included in lspconfig
    vim.lsp.enable 'circleci-yaml-language-server'
  end,
}
