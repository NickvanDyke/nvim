return {
  'olimorris/codecompanion.nvim',
  cmd = 'CodeCompanion',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
    'echasnovski/mini.diff',
  },
  opts = {
    -- system_prompt = function()
    --   local text = io.open('~/.config/opencode/AGENTS.md', 'r'):read '*a'
    --   -- __AUTO_GENERATED_PRINT_VAR_START__
    --   print([==[system_prompt text:]==], vim.inspect(text)) -- __AUTO_GENERATED_PRINT_VAR_END__
    --   return text
    -- end,
    display = {
      chat = {
        window = {
          opts = {
            number = false,
          },
        },
      },
      diff = {
        provider = 'mini_diff',
      },
    },
    adapters = {
      copilot = function()
        return require('codecompanion.adapters').extend('copilot', {
          schema = {
            model = {
              default = 'gpt-4.1',
            },
          },
        })
      end,
    },
  },
  keys = {
    {
      '<leader>ca',
      '<cmd>CodeCompanionActions<cr>',
      mode = { 'n', 'v' },
      noremap = true,
      silent = true,
    },
    {
      '<leader>cc',
      '<cmd>CodeCompanionChat Toggle<cr>',
      mode = { 'n', 'v' },
      noremap = true,
      silent = true,
    },
    {
      '<leader>cs',
      ':CodeCompanion ',
      mode = { 'n', 'v' },
      desc = 'CodeCompanion Send',
      noremap = true,
    },
    {
      'ga',
      '<cmd>CodeCompanionChat Add<cr>',
      mode = { 'v' },
      noremap = true,
      silent = true,
    },
  },
  init = function()
    vim.cmd [[cab cc CodeCompanion]]
  end,
}
