return {
  'utilyre/barbecue.nvim',
  name = 'barbecue',
  version = '*',
  dependencies = {
    'SmiteshP/nvim-navic',
    'nvim-tree/nvim-web-devicons', -- optional dependency
  },
  opts = {
    custom_section = function(bufnr)
      local arrow_icon = package.loaded['arrow'] and require('arrow.statusline').text_for_statusline_with_icons(bufnr) or nil
      return arrow_icon
    end,
  },
}
