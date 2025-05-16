return { -- Highlight, edit, and navigate code
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  main = 'nvim-treesitter.configs', -- Sets main module to use for opts
  event = 'BufReadPre',
  -- [[ Configure Treesitter ]] See `:help nvim-treesitter`
  opts = {
    incremental_selection = {
      enable = true,
      keymaps = {
        node_incremental = '<Tab>',
        node_decremental = '<S-Tab>',
      },
    },
    ensure_installed = {
      'bash',
      'c',
      'diff',
      'html',
      'lua',
      'luadoc',
      'markdown',
      'markdown_inline',
      'php',
      'graphql',
      'query',
      'vim',
      'vimdoc',
      'terraform',
      'json',
      'yaml',
      'sql',
      'regex',
    },
    -- Autoinstall languages that are not installed
    auto_install = true,
    highlight = {
      enable = true,
      -- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
      --  If you are experiencing weird indenting issues, add the language to
      --  the list of additional_vim_regex_highlighting and disabled languages for indent.
      additional_vim_regex_highlighting = { 'ruby' },
    },
    indent = { enable = true, disable = { 'ruby' } },
    matchup = { enable = true },
  },
  init = function()
    -- TODO: Migrate Wanna to use .sql... don't think .psql is a legit thing
    vim.treesitter.language.register('sql', 'psql')
  end,
}
