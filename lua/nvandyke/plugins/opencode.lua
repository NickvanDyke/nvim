return {
  'NickvanDyke/opencode.nvim',
  dir = '~/dev/opencode.nvim',
  lazy = false,
  dependencies = {
    'folke/snacks.nvim',
    -- 'nvimtools/none-ls.nvim',
    -- 'nvim-lua/plenary.nvim',
  },
  ---@type opencode.Config
  opts = {
    auto_reload = true,
    -- auto_register_cmp_sources = {},
    -- port = 12345,
    -- auto_open_embedded = false,
    prompts = {
      joke = {
        description = 'Tell me a cat joke',
        prompt = 'Tell me a joke about cats. Make it funny, but not too funny.',
      },
    },
    -- port = 6969,
    -- Example context integration
    contexts = {
      ---@type opencode.Context
      ['@grapple'] = {
        description = 'Files tracked by Grapple',
        value = function()
          local tags = require('grapple').tags()
          if not tags or #tags == 0 then
            return nil
          end

          local paths = {}
          for _, tag in ipairs(tags) do
            table.insert(paths, tag.path)
          end
          return table.concat(paths, ', ')
        end,
      },
    },
    terminal = {
      win = {
        position = 'left',
      },
    },
  },
  -- stylua: ignore
  keys = {
    { '<leader>ot', function() require('opencode').toggle() end, desc = 'Toggle opencode' },
    { '<leader>oa', function() require('opencode').ask() end, desc = 'Ask opencode', mode = 'n', },
    { '<leader>oa', function() require('opencode').ask('@selection: ') end, desc = 'Ask opencode about selection', mode = 'v', },
    { '<leader>op', function() require('opencode').select_prompt() end, desc = 'Select opencode prompt', mode = { 'n', 'v', }, },
    { '<leader>on', function() require('opencode').command('session_new') end, desc = 'New session', },
    { '<leader>oy', function() require('opencode').command('messages_copy') end, desc = 'Copy last opencode message', },
    { '<S-C-u>', function() require('opencode').command('messages_half_page_up') end, desc = 'New session', },
    { '<S-C-d>', function() require('opencode').command('messages_half_page_down') end, desc = 'New session', },
  },
  setup = function(_, opts)
    require('opencode').setup(opts)

    local prompts = require('opencode.config').options.prompts or {}
    vim.keymap.set('n', '<leader>oj', function()
      require('opencode').prompt(prompts.joke.prompt)
    end, { desc = prompts.joke.description })
  end,
}
