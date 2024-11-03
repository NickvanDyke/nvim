-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
--
-- I think this lags esc in floating terminals
-- vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- NOTE: [[ MY KEYMAPS ]]
-- Easier window resizing
vim.keymap.set('n', '<S-Up>', '<cmd>resize +3<cr>', { desc = 'Increase Window Height' })
vim.keymap.set('n', '<S-Down>', '<cmd>resize -3<cr>', { desc = 'Decrease Window Height' })
vim.keymap.set('n', '<S-Right>', '<cmd>vertical resize +3<cr>', { desc = 'Increase Window Width' })
vim.keymap.set('n', '<S-Left>', '<cmd>vertical resize -3<cr>', { desc = 'Decrease Window Width' })

-- vim.keymap.set('n', '<C-i>', '<C-o>', { desc = 'Jump backwards in jump list', noremap = true })
-- vim.keymap.set('n', '<C-o>', '<C-i>', { desc = 'Jump forwards in jump list', noremap = true })

vim.keymap.set('n', '<C-w>x', '<C-w><C-s>', { desc = 'Split window below' })
vim.keymap.set('n', '<C-w><C-x>', '<C-w><C-s>', { desc = 'Split window below' })
vim.keymap.set('n', '<C-q>', '<C-w><C-q>', { desc = 'Close current window' })

vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move selected lines down' })
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move selected lines up' })

-- NOTE: kinda janky with mini.animate
vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Scroll down half a page, keep cursor centered' })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Scroll up half a page, keep cursor centered' })
vim.keymap.set('n', 'n', 'nzz', { desc = 'Jump to next search result, keep cursor centered' })
vim.keymap.set('n', 'N', 'Nzz', { desc = 'Jump to previous search result, keep cursor centered' })

vim.keymap.set('x', 'P', '"_dP', { desc = 'Paste without yanking' })

-- Conflicts with plugin mappings and I don't like having to be faster than timeoutlen
vim.keymap.set({ 'n', 'x' }, 's', '<Nop>')

vim.keymap.set('n', '<leader>cf', '<cmd>silent !echo %:. | pbcopy<CR>', { desc = '[C]opy relative [F]ile path to clipboard' })

vim.keymap.set('n', '<leader>tl', function()
  ---@diagnostic disable-next-line: undefined-field
  vim.opt.relativenumber = not vim.opt.relativenumber:get()
end, { desc = '[T]oggle [L]ine numbers' })

