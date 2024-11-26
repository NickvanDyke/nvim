return {
  'saghen/blink.cmp',
  -- enabled = false,
  lazy = false, -- lazy loading handled internally
  version = 'v0.5.1', -- 0.6 crashes every time I enter insert?
  opts = {
    keymap = {
      preset = 'default',
      ['<CR>'] = { 'select_and_accept', 'fallback' },
    },
    highlight = {
      -- sets the fallback highlight groups to nvim-cmp's highlight groups
      -- useful for when your theme doesn't support blink.cmp
      -- will be removed in a future release, assuming themes add support
      use_nvim_cmp_as_default = true,
    },
    sources = {
      providers = {
        snippets = {
          enabled = false,
        },
        buffer = {
          -- Otherwise it shows up immediately which is super annoying
          min_keyword_length = 1,
          fallback_for = {},
          score_offset = -3,
        },
      },
    },
    windows = {
      documentation = {
        auto_show = true,
      },
    },
  },
}
