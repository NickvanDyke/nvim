return {
  'mikavilpas/yazi.nvim',
  enabled = true,
  cmd = 'Yazi',
  keys = {
    -- 👇 in this section, choose your own keymappings!
    {
      '\\',
      '<cmd>Yazi<cr>',
      desc = 'Open yazi at the current file',
    },
    -- {
    --   -- Open in the current working directory
    --   '<C-\\>',
    --   '<cmd>Yazi cwd<cr>',
    --   desc = 'Open yazi at neovim cwd',
    -- },
    -- {
    --   '<S-C-\\>',
    --   '<cmd>Yazi toggle<cr>',
    --   desc = 'Resume the last yazi session',
    -- },
  },
  opts = {
    open_for_directories = true, -- open instead of netrw
    keymaps = {
      show_help = '<f1>',
      open_file_in_horizontal_split = '<c-s>',
      grep_in_directory = false, -- attempts to use telescope
    },
  },
  init = function()
    -- 👇 if you use `open_for_directories=true`, this is recommended
    vim.g.loaded_netrwPlugin = 1

    -- Call cmd to load the plugin; otherwise empty buffer because it's lazy loaded
    if vim.fn.argc() == 1 and vim.fn.isdirectory(vim.fn.argv(0)) == 1 then
      vim.cmd 'Yazi'
    end
  end,
}
