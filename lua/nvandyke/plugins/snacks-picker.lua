return {
  'folke/snacks.nvim',
  opts = {
    picker = {
      ui_select = true,
      sources = {
        files = { hidden = true },
      },
      layout = {
        preset = 'vertical',
      },
      win = {
        input = {
          keys = {
            -- ['<c-h>'] = { 'toggle_hidden', mode = { 'i', 'n' } },
            ['<c-i>'] = { 'toggle_ignored', mode = { 'i', 'n' } },
            ['<c-m>'] = { 'toggle_maximize', mode = { 'i', 'n' } },
            ['<s-c-c>'] = { 'cycle_win', mode = { 'i', 'n' } },
          },
        },
        preview = {
          wo = {
            number = vim.o.number,
            relativenumber = vim.o.relativenumber,
            signcolumn = vim.o.signcolumn,
          },
        },
        list = {
          keys = {
            -- TODO:
            ['a'] = {
              function(picker)
                require('nvim_aider').api.add_file(picker:selected())
              end,
              mode = { 'n' },
            },
            ['A'] = {
              function(picker)
                require('nvim_aider').api.add_read_only_file(picker:selected())
              end,
              mode = { 'n' },
            },
          },
        },
      },
    },
  },
  keys = {
    {
      '<leader><leader>',
      function()
        Snacks.picker.smart()
      end,
      desc = 'Smart Picker',
    },
    {
      '<leader>sg',
      function()
        Snacks.picker.grep {
          hidden = true,
        }
      end,
      desc = 'Grep',
    },
    {
      '<leader>sn',
      function()
        Snacks.picker.files { cwd = vim.fn.stdpath 'config' }
      end,
      desc = 'Find Neovim Config File',
    },
    -- grep
    {
      '<leader>sb',
      function()
        Snacks.picker.lines {
          win = {
            preview = {
              wo = {
                -- Matches current window options so layout doesn't shift
                signcolumn = 'yes',
              },
            },
          },
        }
      end,
      desc = 'Buffer Lines',
    },
    {
      '<C-/>',
      function()
        Snacks.picker.lines {
          win = {
            preview = {
              wo = {
                -- Matches current window options so layout doesn't shift
                signcolumn = 'yes',
              },
            },
          },
        }
      end,
      desc = 'Buffer Lines',
    },
    {
      '<leader>sB',
      function()
        Snacks.picker.grep_buffers()
      end,
      desc = 'Grep Open Buffers',
    },
    {
      '<leader>sw',
      function()
        Snacks.picker.grep_word()
      end,
      desc = 'Visual selection or word',
      mode = { 'n', 'x' },
    },
    -- search
    {
      '<leader>s"',
      function()
        Snacks.picker.registers()
      end,
      desc = 'Registers',
    },
    {
      '<leader>s/',
      function()
        Snacks.picker.search_history()
      end,
      desc = 'Search History',
    },
    {
      '<leader>sa',
      function()
        Snacks.picker.autocmds()
      end,
      desc = 'Autocmds',
    },
    {
      '<leader>sc',
      function()
        Snacks.picker.command_history()
      end,
      desc = 'Command History',
    },
    {
      '<leader>sC',
      function()
        Snacks.picker.commands()
      end,
      desc = 'Commands',
    },
    {
      '<leader>sd',
      function()
        Snacks.picker.diagnostics()
      end,
      desc = 'Diagnostics',
    },
    {
      '<leader>sh',
      function()
        Snacks.picker.help()
      end,
      desc = 'Help Pages',
    },
    {
      '<leader>sH',
      function()
        Snacks.picker.highlights()
      end,
      desc = 'Highlights',
    },
    {
      '<leader>sj',
      function()
        Snacks.picker.jumps()
      end,
      desc = 'Jumps',
    },
    {
      '<leader>sk',
      function()
        Snacks.picker.keymaps()
      end,
      desc = 'Keymaps',
    },
    {
      '<leader>sl',
      function()
        Snacks.picker.loclist()
      end,
      desc = 'Location List',
    },
    {
      '<leader>sM',
      function()
        Snacks.picker.man()
      end,
      desc = 'Man Pages',
    },
    {
      '<leader>sm',
      function()
        Snacks.picker.marks()
      end,
      desc = 'Marks',
    },
    {
      '<leader>sr',
      function()
        Snacks.picker.resume()
      end,
      desc = 'Resume',
    },
    {
      '<leader>sq',
      function()
        Snacks.picker.qflist()
      end,
      desc = 'Quickfix List',
    },
    {
      '<leader>uC',
      function()
        Snacks.picker.colorschemes()
      end,
      desc = 'Colorschemes',
    },
    {
      '<leader>sp',
      function()
        Snacks.picker.projects()
      end,
      desc = 'Projects',
    },
    -- LSP
    {
      'grd',
      function()
        Snacks.picker.lsp_definitions()
      end,
      desc = 'Goto Definition',
    },
    {
      'grr',
      function()
        Snacks.picker.lsp_references()
      end,
      nowait = true,
      desc = 'Goto References',
    },
    {
      'gri',
      function()
        Snacks.picker.lsp_implementations()
      end,
      desc = 'Goto Implementation',
    },
    {
      'grt',
      function()
        Snacks.picker.lsp_type_definitions()
      end,
      desc = 'Goto Type Definition',
    },
    {
      '<leader>ss',
      function()
        Snacks.picker.lsp_symbols()
      end,
      desc = 'LSP Symbols',
    },
    {
      '<leader>sS',
      function()
        Snacks.picker.lsp_workspace_symbols()
      end,
      desc = 'LSP Workspace Symbols',
    },
    {
      '<leader>st',
      function()
        Snacks.picker.todo_comments()
      end,
      desc = 'Todo',
    },
  },
}
