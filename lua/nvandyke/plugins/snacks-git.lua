return {
  'folke/snacks.nvim',
  ---@type snacks.Config
  opts = {
    gh = {},
    lazygit = {
      enabled = true,
      -- https://github.com/folke/snacks.nvim/issues/46
      -- Change default settings to open edits in the current tab, not a new one
      config = {
        os = {
          edit = 'if test -z "$NVIM"; nvim -- {{filename}}; else; nvim --server "$NVIM" --remote-send "q"; nvim --server "$NVIM" --remote {{filename}}; end',
          editAtLine = 'if test -z "$NVIM"; nvim +{{line}} -- {{filename}}; else; nvim --server "$NVIM" --remote-send "q"; nvim --server "$NVIM" --remote {{filename}}; nvim --server "$NVIM" --remote-send ":{{line}}<CR>"; end',
          editAtLineAndWait = 'nvim +{{line}} {{filename}}',
          openDirInEditor = 'if test -z "$NVIM"; nvim -- {{dir}}; else; nvim --server "$NVIM" --remote-send "q"; nvim --server "$NVIM" --remote {{dir}}; end',
        },
      },
    },
  },
  keys = {
    {
      '<leader>gg',
      function()
        ---@diagnostic disable-next-line: missing-fields
        Snacks.lazygit.open {
          -- Current file's directory, in case Neovim's cwd is not a git repository (like the parent of many repos)
          cwd = vim.fn.expand '%:h',
        }
      end,
      desc = 'LazyGit',
    },
    -- {
    --   '<leader>gf',
    --   function()
    --     Snacks.lazygit.log_file()
    --   end,
    --   desc = 'LazyGit Log (current file)',
    -- },
    -- {
    --   '<leader>gl',
    --   function()
    --     Snacks.lazygit.log()
    --   end,
    --   desc = 'LazyGit Log',
    -- },
    -- {
    --   '<leader>gb',
    --   function()
    --     Snacks.git.blame_line()
    --   end,
    --   desc = 'Git Blame Line',
    -- },
  },
}
