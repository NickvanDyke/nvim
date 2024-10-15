return {
  'nvim-treesitter/nvim-treesitter-textobjects',
  config = function()
    ---@diagnostic disable-next-line: missing-fields
    require('nvim-treesitter.configs').setup {
      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ['af'] = '@function.outer',
            ['if'] = '@function.inner',
            ['ac'] = '@class.outer',
            ['ic'] = '@class.inner',
            ['ip'] = '@parameter.inner',
            ['ap'] = '@parameter.outer',
          },
        },
        swap = {
          enable = true,
          swap_next = {
            ['<leader>p'] = '@parameter.inner',
          },
          swap_previous = {
            ['<leader>P'] = '@parameter.inner',
          },
        },
        move = {
          enable = true,
          set_jumps = true,
          goto_next_start = {
            [']f'] = '@function.outer',
            [']]'] = '@class.outer',
            [']p'] = '@parameter.inner',
          },
          goto_next_end = {
            [']F'] = '@function.outer',
            [']['] = '@class.outer',
            [']P'] = '@parameter.inner',
          },
          goto_previous_start = {
            ['[f'] = '@function.outer',
            ['[['] = '@class.outer',
            ['[p'] = '@parameter.inner',
          },
          goto_previous_end = {
            ['[F'] = '@function.outer',
            ['[]'] = '@class.outer',
            ['[P'] = '@parameter.inner',
          },
        },
      },
    }
  end,
}
