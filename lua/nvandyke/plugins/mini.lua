return { -- Collection of various small independent plugins/modules
  'echasnovski/mini.nvim',
  config = function()
    -- Better Around/Inside textobjects
    --
    -- Examples:
    --  - va)  - [V]isually select [A]round [)]paren
    --  - yinq - [Y]ank [I]nside [N]ext [Q]uote
    --  - ci'  - [C]hange [I]nside [']quote
    require('mini.ai').setup { n_lines = 500 }

    -- TODO: toggleable for pair programming
    -- require('mini.animate').setup {
    -- }
    -- So mini.animate isn't janky
    -- vim.opt.mousescroll = "ver:1,hor:1"

    -- ... and there is more!
    --  Check out: https://github.com/echasnovski/mini.nvim
    -- require('mini.animate').setup()
    require('mini.splitjoin').setup()
    require('mini.indentscope').setup()
    -- require('mini.starter').setup()
    -- require('mini.sessions').setup {
    --   autoread = true,
    --   hooks = {
    --     post = {
    --       read = function()
    --         require('arrow.git').refresh_git_branch() -- only if separated_by_branch is true
    --         require('arrow.persist').load_cache_file()
    --       end,
    --     },
    --   },
    -- }
    -- require('mini.files').setup {}
    -- vim.keymap.set('n', '\\', function()
    --   require('mini.files').open(vim.api.nvim_buf_get_name(0))
    -- end, { desc = 'Files' })
  end,
}
