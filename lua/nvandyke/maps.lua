-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Keybinds to make split navigation easier.
-- Eh idk. Valuable keys.
-- vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
-- vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
-- vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
-- vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- vim.keymap.set('n', '<C-q>', '<C-w><C-q>', { desc = 'Close current window' })

vim.keymap.set({ 'n', 'v' }, 'H', '^', { desc = 'Move to the beginning of the line' })
vim.keymap.set({ 'n', 'v' }, 'L', '$', { desc = 'Move to the end of the line' })

-- Easier window resizing
vim.keymap.set('n', '<S-Up>', '<cmd>resize +3<cr>', { desc = 'Increase Window Height', silent = true })
vim.keymap.set('n', '<S-Down>', '<cmd>resize -3<cr>', { desc = 'Decrease Window Height', silent = true })
vim.keymap.set('n', '<S-Right>', '<cmd>vertical resize +3<cr>', { desc = 'Increase Window Width', silent = true })
vim.keymap.set('n', '<S-Left>', '<cmd>vertical resize -3<cr>', { desc = 'Decrease Window Width', silent = true })

vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move selected lines down', silent = true })
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move selected lines up', silent = true })

vim.keymap.set('x', 'P', '"_dP', { desc = 'Paste without yanking' })

vim.keymap.set('n', 'y=', function()
  vim.cmd [[ silent !echo %:. | pbcopy ]]
  vim.notify('Copied ' .. vim.fn.expand '%:.')
end, { desc = 'Copy relative filepath to clipboard' })

vim.keymap.set('n', '<leader>qf', '<cmd>copen<cr>', { desc = 'QuickFix list' })
vim.keymap.set('n', '<leader>ql', '<cmd>lopen<cr>', { desc = 'Location list' })

vim.keymap.set('n', '<Leader>r', [[:%s/\<<C-r><C-w>\>//g<Left><Left>]], { desc = 'Replace word under cursor' })

vim.keymap.set('n', 'gG', 'gg<S-v>G', { desc = 'Select all' })

vim.keymap.set('n', '<C-c>', 'ciw')

vim.keymap.set('i', '<C-j>', "[[<C-r>=strftime('%Y-%m-%d')<CR>]]", { desc = 'Insert current date', silent = true })
