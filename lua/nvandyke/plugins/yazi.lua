return {
  'mikavilpas/yazi.nvim',
  cmd = 'Yazi',
  keys = {
    -- 👇 in this section, choose your own keymappings!
    {
      '\\',
      '<cmd>Yazi<cr>',
      desc = 'Open yazi at the current file',
    },
    {
      -- Open in the current working directory
      '<C-\\>',
      '<cmd>Yazi cwd<cr>',
      desc = "Open the file manager in nvim's working directory",
    },
    {
      -- NOTE: this requires a version of yazi that includes
      -- https://github.com/sxyazi/yazi/pull/1305 from 2024-07-18
      '<S-C-\\>',
      '<cmd>Yazi toggle<cr>',
      desc = 'Resume the last yazi session',
    },
  },
  opts = {
    -- if you want to open yazi instead of netrw, see below for more info
    -- must be loaded at startup for this
    open_for_directories = true,
    keymaps = {
      show_help = '<f1>',
      open_file_in_horizontal_split = '<c-s>',
      grep_in_directory = false, -- attempts to use telescope
    },
  },
  -- 👇 if you use `open_for_directories=true`, this is recommended
  init = function()
    -- More details: https://github.com/mikavilpas/yazi.nvim/issues/802
    -- vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    if vim.fn.argc() == 1 and vim.fn.isdirectory(vim.fn.argv(0)) == 1 then
      vim.cmd 'Yazi'
    end
  end,
}
