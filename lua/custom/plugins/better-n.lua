return {
  'jonatan-branting/nvim-better-n',
  opts = {},
  config = function()
    require('better-n').setup({})

    local hunk_navigation = require('better-n').create {
      next = require('gitsigns').next_hunk,
      previous = require('gitsigns').prev_hunk,
    }

    vim.keymap.set({ 'n', 'x' }, ']c', hunk_navigation.next, { desc = 'Jump to next git [c]hange' })
    vim.keymap.set({ 'n', 'x' }, '[c', hunk_navigation.previous, { desc = 'Jump to previous git [c]hange' })
  end,
}
