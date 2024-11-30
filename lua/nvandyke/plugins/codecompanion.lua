return {
  'olimorris/codecompanion.nvim',
  cmd = { 'CodeCompanion', 'CodeCompanionActions', 'CodeCompanionChat' },
  event = 'InsertEnter',
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
    {
      'zbirenbaum/copilot.lua',
      opts = {
        suggestion = {
          auto_trigger = true,
          hide_during_completion = false,
          keymap = {
            accept = false,
          },
        },
      },
      config = function(_, opts)
        require('copilot').setup(opts)
        -- https://github.com/zbirenbaum/copilot.lua/discussions/153
        vim.keymap.set('i', '<Tab>', function()
          if require('copilot.suggestion').is_visible() then
            require('copilot.suggestion').accept()
          else
            vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<Tab>', true, false, true), 'n', false)
          end
        end, { desc = 'Super Tab' })
      end,
    },

    -- Optional dependencies
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
