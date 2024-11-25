return {
  'rachartier/tiny-inline-diagnostic.nvim',
  event = 'LspAttach', -- Or `LspAttach`
  priority = 1000, -- needs to be loaded in first
  config = function()
    require('tiny-inline-diagnostic').setup({
      options = {
        multilines = true,
        show_source = true,
        show_all_diags_on_cursorline = true,
      }
    })
  end,
}
