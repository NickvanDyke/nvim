return {
  {
    'echasnovski/mini.animate',
    version = false,
    keys = {
      {
        '<leader>ts',
        function()
          vim.g.minianimate_disable = not vim.g.minianimate_disable
          vim.cmd 'Twilight'
          vim.cmd 'Screenkey'
        end,
        noremap = true,
        silent = true,
        desc = '[T]oggle [s]creenshare stuff',
      },
    },
    config = function()
      vim.g.minianimate_disable = true -- it'll get immediately toggled on first run
      require('mini.animate').setup()
    end,
  },
  {
    'folke/twilight.nvim',
    cmd = 'Twilight',
    opts = {},
  },
  {
    'NStefan002/screenkey.nvim',
    version = '*', -- or branch = "dev", to use the latest commit
    cmd = 'Screenkey',
  },
}
