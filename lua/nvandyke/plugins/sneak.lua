return {
  'justinmk/vim-sneak',
  config = function()
    vim.keymap.set({ 'x', 'o' }, 's', '<Plug>Sneak_s', { noremap = false })
    vim.keymap.set({ 'x', 'o' }, 'S', '<Plug>Sneak_S', { noremap = false })

    -- FIX: Still pops up with cmdheight = 0...
    -- vim.g['sneak#prompt'] = ''
  end,
}
