return {
  'saghen/blink.cmp',
  lazy = false, -- lazy loading handled internally
  version = 'v0.*',
  opts = {
    keymap = {
      accept = '<CR>',
    },
    highlight = {
      -- sets the fallback highlight groups to nvim-cmp's highlight groups
      -- useful for when your theme doesn't support blink.cmp
      -- will be removed in a future release, assuming themes add support
      use_nvim_cmp_as_default = true,
    },
    sources = {
      providers = {
        buffer = {
          -- Otherwise it shows up immediately which is super annoying
          min_keyword_length = 1,
          fallback_for = {}
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
