-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Keybinds to make split navigation easier.
-- Eh idk. Valuable keys.
-- vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
-- vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
-- vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
-- vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- See focus.lua too
vim.keymap.set('n', '<C-q>', '<C-w><C-q>', { desc = 'Close current window' })

-- Easier window resizing
vim.keymap.set('n', '<S-Up>', '<cmd>resize +3<cr>', { desc = 'Increase Window Height', silent = true })
vim.keymap.set('n', '<S-Down>', '<cmd>resize -3<cr>', { desc = 'Decrease Window Height', silent = true })
vim.keymap.set('n', '<S-Right>', '<cmd>vertical resize +3<cr>', { desc = 'Increase Window Width', silent = true })
vim.keymap.set('n', '<S-Left>', '<cmd>vertical resize -3<cr>', { desc = 'Decrease Window Width', silent = true })

vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move selected lines down', silent = true })
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move selected lines up', silent = true })

-- NOTE: kinda janky with mini.animate
-- vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Scroll down half a page, keep cursor centered' })
-- vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Scroll up half a page, keep cursor centered' })
-- vim.keymap.set('n', 'n', 'nzz', { desc = 'Jump to next search result, keep cursor centered' })
-- vim.keymap.set('n', 'N', 'Nzz', { desc = 'Jump to previous search result, keep cursor centered' })

vim.keymap.set('x', 'P', '"_dP', { desc = 'Paste without yanking' })

vim.keymap.set('n', 'y=', function()
  vim.cmd [[ silent !echo %:. | pbcopy ]]
  vim.notify('Copied ' .. vim.fn.expand '%:.')
end, { desc = 'Copy relative filepath to clipboard' })

vim.keymap.set('n', '<leader>qf', '<cmd>copen<cr>', { desc = 'QuickFix list' })
vim.keymap.set('n', '<leader>ql', '<cmd>lopen<cr>', { desc = 'Location list' })

-- vim.keymap.set('n', '<C-d>', function()
--   local quarter_height = math.floor(vim.api.nvim_win_get_height(0) / 3)
--   local keys = vim.api.nvim_replace_termcodes(quarter_height .. '<C-d>', true, false, true)
--   vim.api.nvim_feedkeys(keys, 'n', false)
-- end, { desc = 'Scroll down a third of the window height' })
--
-- vim.keymap.set('n', '<C-u>', function()
--   local quarter_height = math.floor(vim.api.nvim_win_get_height(0) / 3)
--   local keys = vim.api.nvim_replace_termcodes(quarter_height .. '<C-u>', true, false, true)
--   vim.api.nvim_feedkeys(keys, 'n', false)
-- end, { desc = 'Scroll up a third of the window height' })

vim.keymap.set('n', '<Leader>r', [[:%s/\<<C-r><C-w>\>//g<Left><Left>]], { desc = 'Replace word under cursor' })

vim.keymap.set('n', 'gG', 'gg<S-v>G', { desc = 'Select all' })

-- vim.keymap.set('n', '<C-c>', 'ciw')
