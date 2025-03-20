return { -- Formatting
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },
  keys = {
    {
      '<leader>f',
      function()
        require('conform').format { async = true, lsp_format = 'fallback' }
      end,
      mode = '',
      desc = 'Format buffer',
    },
  },
  opts = {
    notify_on_error = false,
    format_on_save = {
      timeout_ms = 500,
      lsp_format = 'fallback',
    },
    formatters_by_ft = {
      lua = { 'stylua' },
      javascript = { 'prettierd', 'prettier', lsp_format = 'fallback', stop_after_first = true },
      typescript = { 'prettierd', 'prettier', lsp_format = 'fallback', stop_after_first = true },
      javascriptreact = { 'prettierd', 'prettier', lsp_format = 'fallback', stop_after_first = true },
      typescriptreact = { 'prettierd', 'prettier', lsp_format = 'fallback', stop_after_first = true },
      html = { 'prettierd', 'prettier', lsp_format = 'fallback', stop_after_first = true },
      sql = { 'sqlfmt', lsp_format = 'never', stop_after_first = true },
      terraform = { lsp_format = 'always', stop_after_first = true },
    },
  },
}
