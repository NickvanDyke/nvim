return {
  'rmagatti/goto-preview',
  event = 'LspAttach',
  config = function()
    require('goto-preview').setup {
      default_mappings = true,
      focus_on_open = false,
      dismiss_on_move = true,
      border = { '↖', '─', '╮', '│', '╯', '─', '╰', '│' },
      -- vim.g.border_default == 'none' and { ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ' } or
    }
  end,
}
