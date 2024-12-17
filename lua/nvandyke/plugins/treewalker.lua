return {
  'aaronik/treewalker.nvim',
  opts = {
    highlight = true, -- default is false
  },
  keys = {
    { mode = { 'n', 'x' }, '<C-j>', '<cmd>Treewalker Down<CR>', noremap = true, silent = true },
    { mode = { 'n', 'x' }, '<C-k>', '<cmd>Treewalker Up<CR>', noremap = true, silent = true },
    { mode = { 'n', 'x' }, '<C-h>', '<cmd>Treewalker Left<CR>', noremap = true, silent = true },
    { mode = { 'n', 'x' }, '<C-l>', '<cmd>Treewalker Right<CR>', noremap = true, silent = true },
  },
}
