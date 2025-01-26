return {
  'saghen/blink.cmp',
  -- enabled = false, -- NOTE: if it crashes after updating, re-install; https://github.com/Saghen/blink.cmp/issues/68
  -- lazy = false, -- lazy loading handled internally
  version = 'v0.*',
  event = { 'InsertEnter', 'CmdlineEnter' },
  opts = {
    keymap = {
      preset = 'enter',
    },
    appearance = {
      -- sets the fallback highlight groups to nvim-cmp's highlight groups
      -- useful for when your theme doesn't support blink.cmp
      -- will be removed in a future release, assuming themes add support
      use_nvim_cmp_as_default = true,
    },
    sources = {
      per_filetype = {
        markdown = {},
        org = { 'orgmode' },
      },
      -- NOTE: breaks orgmode completion
      -- cmdline = function()
      --   local type = vim.fn.getcmdtype()
      --   -- Search forward and backward
      --   if type == '/' or type == '?' then
      --     -- return { 'buffer' }
      --     return {} -- it auto-shows and that's annoying
      --   end
      --   -- Commands
      --   if type == ':' then
      --     return { 'cmdline' }
      --   end
      --   return {}
      -- end,
      providers = {
        snippets = {
          enabled = false,
        },
        lsp = {},
        path = {},
        buffer = {
          min_keyword_length = 3,
          score_offset = -3,
        },
        orgmode = {
          name = 'Orgmode',
          module = 'orgmode.org.autocompletion.blink',
          fallbacks = { 'buffer' },
        },
      },
    },
    completion = {
      trigger = {
        show_on_insert_on_trigger_character = false,
      },
      menu = {
        border = 'none', -- anything else looks bad
        winblend = vim.g.winblend_default,
        draw = {
          treesitter = { 'lsp' },
        },
      },
      documentation = {
        auto_show = true,
        treesitter_highlighting = true,
        window = {
          border = vim.g.border_default,
          winblend = vim.g.winblend_default,
        },
      },
    },
    signature = {
      window = {
        border = vim.g.border_default,
        winblend = vim.g.winblend_default,
        treesitter_highlighting = true,
      },
    },
  },
}
