return { -- Fuzzy Finder (files, lsp, etc)
  'nvim-telescope/telescope.nvim',
  event = 'VeryLazy',
  dependencies = {
    'nvim-lua/plenary.nvim',
    { -- If encountering errors, see telescope-fzf-native README for installation instructions
      'nvim-telescope/telescope-fzf-native.nvim',

      -- `build` is used to run some command when the plugin is installed/updated.
      -- This is only run then, not every time Neovim starts up.
      build = 'make',

      -- `cond` is a condition used to determine whether this plugin should be
      -- installed and loaded.
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },
    -- Useful for getting pretty icons, but requires a Nerd Font.
    { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
    'nvim-telescope/telescope-live-grep-args.nvim',
    'nvim-telescope/telescope-ui-select.nvim',
  },
  config = function()
    require('telescope').setup {
      -- You can put your default mappings / updates / etc. in here
      --  All the info you're looking for is in `:help telescope.setup()`
      --
      -- defaults = {
      --   mappings = {
      --     i = { ['<c-enter>'] = 'to_fuzzy_refine' },
      --   },
      -- },
      -- pickers = {},
      defaults = {
        path_display = {
          'smart',
        },
        layout_strategy = 'vertical',
        layout_config = {
          -- prompt_position = 'top',
          -- vertical = {
          --   mirror = true
          -- }
        },
        mappings = {
          n = {
            ['q'] = require('telescope.actions').close,
            ['<esc>'] = require('telescope.actions').close,
            -- ['<C-t>'] = require('trouble.sources.telescope').open,
            ['<C-d>'] = require('telescope.actions').delete_buffer,
          },
          i = {
            ['<C-s>'] = require('telescope.actions').select_horizontal,
            -- ['<C-t>'] = require('trouble.sources.telescope').open,
            ['<C-w>'] = function()
              vim.api.nvim_input '<c-s-w>'
            end,
            ['<C-;>'] = function()
              -- TODO: how to display icon next to picker result when already saved?
              local action_state = require 'telescope.actions.state'
              local relative_path = vim.fn.fnamemodify(action_state.get_selected_entry().path, ':.' .. vim.fn.getcwd())
              -- require('arrow.persist').save(relative_path)
            end,
          },
        },
      },
      extensions = {
        ['ui-select'] = {
          require('telescope.themes').get_dropdown {
            -- even more opts
          },
        },
        smart_open = {
          match_algorithm = 'fzf',
          mappings = {
            i = {
              -- idk why we have to define this again and it doesn't use the default
              ['<C-w>'] = function()
                vim.api.nvim_input '<c-s-w>'
              end,
            },
          },
        },
        live_grep_args = {
          mappings = {
            i = {
              ['<C-k>'] = require('telescope-live-grep-args.actions').quote_prompt(),
            },
          },
        },
      },
    }

    pcall(require('telescope').load_extension, 'fzf')
    pcall(require('telescope').load_extension, 'live_grep_args')
    pcall(require('telescope').load_extension 'ui-select')

    -- See `:help telescope.builtin`
    local builtin = require 'telescope.builtin'
    vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[s]earch [h]elp', silent = true })
    vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[s]earch [k]eymaps', silent = true })
    vim.keymap.set('n', '<leader>sb', builtin.builtin, { desc = '[s]earch Telescope [b]uiltins', silent = true })
    vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[s]earch current [w]ord', silent = true })
    vim.keymap.set(
      'n',
      '<leader>sg',
      ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>",
      { desc = '[s]earch with [g]rep (args)', silent = true }
    )
    vim.keymap.set('n', '<leader>sq', builtin.quickfix, { desc = '[s]earch [q]uickfix', silent = true })

    -- Slightly advanced example of overriding default behavior and theme
    vim.keymap.set('n', '<C-/>', function()
      -- You can pass additional configuration to Telescope to change the theme, layout, etc.
      builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        winblend = 10,
        previewer = false,
      })
    end, { desc = '[/] Fuzzily search in current buffer', silent = true })

    vim.keymap.set('n', '<leader>sc', function()
      builtin.find_files { cwd = '~/.config/', hidden = true }
    end, { desc = '[s]earch [c]onfig files', silent = true })

    vim.keymap.set('n', '<leader>ut', function()
      builtin.colorscheme {
        enable_preview = true,
      }
    end, { desc = 'Telescope [t]hemes', silent = true })
  end,
}
