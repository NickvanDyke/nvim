return {
  'saghen/blink.cmp',
  -- enabled = false, -- NOTE: if it crashes after updating, re-install; https://github.com/Saghen/blink.cmp/issues/68
  lazy = false, -- lazy loading handled internally
  version = 'v0.*',
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
      providers = {
        snippets = {
          enabled = false,
          fallbacks = {},
        },
        lsp = {
          min_keyword_length = 3,
          fallbacks = {},
        },
        path = {
          fallbacks = {},
        },
        buffer = {
          min_keyword_length = function()
            return vim.bo.filetype == 'markdown' and 999 or 3
          end,
          score_offset = -3,
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
      },
      documentation = {
        auto_show = true,
        treesitter_highlighting = true,
        window = {
          border = vim.g.border_default,
          winblend = vim.g.winblend_default,
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
  },
}
