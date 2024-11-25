return {
  'olimorris/codecompanion.nvim',
  cmd = { 'CodeCompanion', 'CodeCompanionActions', 'CodeCompanionChat' },
  event = 'BufReadPost',
  keys = {
    {
      '<LocalLeader>ca',
      '<cmd>CodeCompanionActions<cr>',
      mode = { 'n', 'v' },
      desc = 'Code[C]ompanion [A]ctions',
      noremap = true,
      silent = true,
    },
    {
      '<LocalLeader>cc',
      '<cmd>CodeCompanionChat Toggle<cr>',
      mode = { 'n', 'v' },
      desc = 'Code[C]ompanion [C]hat',
      noremap = true,
      silent = true,
    },
    {
      'ga',
      '<cmd>CodeCompanionChat Add<cr>',
      desc = 'Add to CodeCompanion Chat',
      mode = 'v',
      noremap = true,
      silent = true,
    },
  },
  dependencies = {
    'github/copilot.vim', -- codecompanion doesn't offer inline/virtual text completion itself
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
    -- TODO: possible with blink.cmp?
    -- "hrsh7th/nvim-cmp", -- Optional: For using slash commands and variables in the chat buffer
    'nvim-telescope/telescope.nvim', -- Optional: For using slash commands
    { 'MeanderingProgrammer/render-markdown.nvim', ft = { 'markdown', 'codecompanion' } }, -- Optional: For prettier markdown rendering
    -- { "stevearc/dressing.nvim", opts = {} }, -- Optional: Improves `vim.ui.select`
  },
  opts = {
    display = {
      chat = {
        render_headers = false,
      },
    },
    strategies = {
      chat = {
        adapter = 'copilot',
      },
      inline = {
        adapter = 'copilot',
      },
    },
  },
  init = function()
    -- Expand 'cc' into 'CodeCompanion' in the command line
    vim.cmd [[cab cc CodeCompanion]]
  end,
}
