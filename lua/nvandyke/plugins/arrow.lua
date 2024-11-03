return {
  "otavioschwanck/arrow.nvim",
  dependencies = {
    { "nvim-tree/nvim-web-devicons" },
    -- or if using `mini.icons`
    -- { "echasnovski/mini.icons" },
  },
  opts = {
    show_icons = true,
    leader_key = ';', -- Recommended to be a single key
    buffer_leader_key = 'm', -- Per Buffer Mappings
    separate_by_branch = true,
    save_key = 'git_root',
    mappings = {
      open_vertical = '<C-v>',
      open_horizontal = '<C-x>',
    }
  }
}
