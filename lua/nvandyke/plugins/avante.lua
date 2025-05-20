return {
  'yetone/avante.nvim',
  event = 'VeryLazy',
  version = false, -- Never set this value to "*"! Never!
  opts = {
    selector = { provider = 'snacks' },
    provider = 'copilot',
    -- https://github.com/yetone/avante.nvim/issues/1048
    -- auto_suggestions_provider = 'copilot',

    behavior = {
      auto_apply_diff_after_generation = true,
    },
    suggestion = {
      -- https://github.com/yetone/avante.nvim/issues/1048
      debounce = 5000,
      throttle = 5000,
    },
    windows = {
      width = 41,
      ask = {
        -- floating = true,
      },
    },
  },
  -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
  build = 'make',
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'stevearc/dressing.nvim',
    'nvim-lua/plenary.nvim',
    'MunifTanjim/nui.nvim',
    'nvim-tree/nvim-web-devicons',
    'folke/snacks.nvim',
    'saghen/blink.cmp',
    {
      -- support for image pasting
      'HakonHarnes/img-clip.nvim',
      enabled = false,
      event = 'VeryLazy',
      opts = {
        -- recommended settings
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = {
            insert_mode = true,
          },
          -- required for Windows users
          use_absolute_path = true,
        },
      },
    },
    {
      -- Make sure to set this up properly if you have lazy=true
      'MeanderingProgrammer/render-markdown.nvim',
      ft = { 'Avante' },
      opts = {
        file_types = { 'Avante' },
      },
    },
  },
}
