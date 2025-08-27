return {
  'NickvanDyke/opencode.nvim',
  dir = '~/dev/opencode.nvim',
  lazy = false,
  dependencies = {
    { 'folke/snacks.nvim' },
    -- 'nvimtools/none-ls.nvim',
    -- 'nvim-lua/plenary.nvim',
  },
  ---@type opencode.Opts
  opts = {
    -- auto_reload = true,
    -- port = 6969,
    -- auto_register_cmp_sources = {},
    -- on_send = function() end,
    -- on_opencode_not_found = function()
    --   return false
    -- end,
    prompts = {
      joke = {
        description = 'Personify as cat',
        prompt = 'Personify @buffer as a cat and write a one-paragraph story about it.',
      },
    },
    terminal = {
      -- Override my snacks.nvim terminal config. No reason to prefer normal mode for opencode - can't scroll its TUI like a normal terminal buffer.
      auto_insert = true,
      auto_close = true,
      win = {
        position = 'left',
      },
    },
  },
  -- stylua: ignore
  keys = {
    { '<leader>ot', function() require('opencode').toggle() end, desc = 'Toggle opencode' },
    { '<leader>oA', function() require('opencode').ask() end, desc = 'Ask opencode', },
    { '<leader>oa', function() require('opencode').ask('@cursor: ') end, desc = 'Ask opencode about this', mode = 'n', },
    { '<leader>oa', function() require('opencode').ask('@selection: ') end, desc = 'Ask opencode about selection', mode = 'v', },
    { '<leader>op', function() require('opencode').select_prompt() end, desc = 'Select opencode prompt', mode = { 'n', 'v', }, },
    { '<leader>on', function() require('opencode').command('session_new') end, desc = 'New session', },
    { '<leader>oy', function() require('opencode').command('messages_copy') end, desc = 'Copy last opencode message', },
    { '<S-C-u>', function() require('opencode').command('messages_half_page_up') end, desc = 'New session', },
    { '<S-C-d>', function() require('opencode').command('messages_half_page_down') end, desc = 'New session', },
    -- { '<Tab>', function() require('opencode.suggestion').accept() end, desc = 'Accept suggestion', mode = { 'n' }, },
    -- { '<Esc>', function()
    --   if not require('opencode.suggestion').reject() then
    --     vim.cmd('nohlsearch')
    --     -- TODO: More general handling of <Esc> fallthrough?
    --
    --   end
    -- end, desc = 'Reject suggestion', mode = { 'n' }, },
  },
  config = function(_, opts)
    vim.opt.autoread = true

    require('opencode').setup(opts)
  end,
}
