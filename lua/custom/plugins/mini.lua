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

    -- Simple and easy statusline.
    --  You could remove this setup call if you don't like it,
    --  and try some other statusline plugin
    local statusline = require 'mini.statusline'
    -- set use_icons to true if you have a Nerd Font
    statusline.setup {
      use_icons = vim.g.have_nerd_font,
      content = {
        active = function()
          -- Initially copied from https://github.com/echasnovski/mini.nvim/blob/2c55015a518e11ea9d49bb96078f5ede51f5d2af/doc/mini-statusline.txt#L87-L105
          local mode, mode_hl = MiniStatusline.section_mode { trunc_width = 120 }
          local git = MiniStatusline.section_git { trunc_width = 40 }
          local diff = MiniStatusline.section_diff { trunc_width = 75 }
          local diagnostics = MiniStatusline.section_diagnostics { trunc_width = 75 }
          local lsp = MiniStatusline.section_lsp { trunc_width = 75 }
          local filename = MiniStatusline.section_filename { trunc_width = 140 }
          local fileinfo = MiniStatusline.section_fileinfo { trunc_width = 120 }
          local location = '%2l:%-2v'
          local search = MiniStatusline.section_searchcount { trunc_width = 75 }

          local codeium = require('codeium.virtual_text').status_string()

          return MiniStatusline.combine_groups {
            { hl = mode_hl, strings = { mode } },
            { hl = 'MiniStatuslineDevinfo', strings = { git, diff, diagnostics, lsp } },
            '%<', -- Mark general truncate point
            { hl = 'MiniStatuslineFilename', strings = { filename } },
            '%=', -- End left alignment
            { hl = 'MiniStatuslineDevinfo', strings = { codeium } },
            { hl = 'MiniStatuslineFileinfo', strings = { fileinfo } },
            { hl = mode_hl, strings = { search, location } },
          }
        end,
      },
    }

    -- ... and there is more!
    --  Check out: https://github.com/echasnovski/mini.nvim
    -- require('mini.animate').setup()
    require('mini.splitjoin').setup()
    require('mini.jump').setup()
    require('mini.indentscope').setup()
    require('mini.starter').setup()
    require('mini.sessions').setup {
      autoread = true,
    }
    -- require('mini.files').setup {}
    -- vim.keymap.set('n', '\\', function()
    --   require('mini.files').open(vim.api.nvim_buf_get_name(0))
    -- end, { desc = 'Files' })
  end,
}
