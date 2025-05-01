-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- FIX: breaks noice/nui: https://github.com/folke/noice.nvim/issues/1082
vim.o.winborder = 'rounded'

vim.g.winblend_default = 20

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = 'a'

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)

vim.opt.linebreak = true
vim.opt.showbreak = '↪'
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 300

vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.splitkeep = 'cursor'

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = {
  tab = '» ',
  trail = '·',
  nbsp = '␣',
}
vim.opt.fillchars = {
  eob = ' ',
  lastline = ' ',
}

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

vim.opt.cursorline = true

vim.opt.scrolloff = 11
vim.opt.sidescrolloff = 11

-- TODO: apparently Postgres files should still be .sql?
vim.filetype.add {
  extension = {
    psql = 'sql',
  },
}

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = false

vim.opt.swapfile = false
-- vim.opt.autowrite = true
vim.opt.autoread = true

vim.opt.laststatus = 3

vim.opt.cmdheight = 0

vim.opt.wrap = false

vim.diagnostic.config {
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = '',
      [vim.diagnostic.severity.WARN] = '',
      [vim.diagnostic.severity.INFO] = '',
      [vim.diagnostic.severity.HINT] = '󰠠',
    },
    -- linehl = {
    --   [vim.diagnostic.severity.ERROR] = 'Error',
    --   [vim.diagnostic.severity.WARN] = 'Warn',
    --   [vim.diagnostic.severity.INFO] = 'Info',
    --   [vim.diagnostic.severity.HINT] = 'Hint',
    -- },
  },
  -- virtual_text = {
  --   current_line = true,
  --   prefix = '',
  -- },
  severity_sort = true,
  underline = true,
  virtual_lines = {
    current_line = true,
  },
  float = {
    source = true,
  },
  jump = {
    -- float = true,
  },
}

-- To make CopilotChat completion behave well
vim.opt.completeopt = { 'menuone', 'popup', 'noinsert' }

vim.opt.termguicolors = true
