return {
  'nvim-telescope/telescope.nvim',
  event = 'VeryLazy',
  dependencies = {
    'nvim-lua/plenary.nvim',
    { -- If encountering errors, see telescope-fzf-native README for installation instructions
      'nvim-telescope/telescope-fzf-native.nvim',
      -- `build` is used to run some command when the plugin is installed/updated.
      -- This is only run then, not every time Neovim starts up.
      build = 'make',
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },
    { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
    'nvim-telescope/telescope-live-grep-args.nvim',
    'nvim-telescope/telescope-ui-select.nvim',
  },
  opts = {
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
            ['<C-k>'] = function(prompt_bufnr)
              require('telescope-live-grep-args.actions').quote_prompt()(prompt_bufnr)
            end,
          },
        },
      },
    },
  },
  keys = {
    {
      '<leader>sh',
      function()
        require('telescope.builtin').help_tags()
      end,
      desc = '[s]earch [h]elp',
      silent = true,
      mode = 'n',
    },
    {
      '<leader>sk',
      function()
        require('telescope.builtin').keymaps()
      end,
      desc = '[s]earch [k]eymaps',
      silent = true,
      mode = 'n',
    },
    {
      '<leader>sb',
      function()
        require('telescope.builtin').builtin()
      end,
      desc = '[s]earch Telescope [b]uiltins',
      silent = true,
      mode = 'n',
    },
    {
      '<leader>sw',
      function()
        require('telescope-live-grep-args.shortcuts').shortcuts.grep_word_under_cursor()
      end,
      desc = '[s]earch current [w]ord',
      silent = true,
      mode = 'n',
    },
    {
      '<leader>sg',
      ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>",
      desc = '[s]earch with [g]rep (args)',
      silent = true,
      mode = 'n',
    },
    {
      '<leader>sq',
      require('telescope.builtin').quickfix,
      desc = '[s]earch [q]uickfix',
      silent = true,
      mode = 'n',
    },
    {
      '<C-/>',
      function()
        require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
          winblend = vim.g.winblend_default,
          previewer = false,
        })
      end,
      desc = '[/] Fuzzily search in current buffer',
      silent = true,
      mode = 'n',
    },
    {
      '<leader>sc',
      function()
        require('telescope.builtin').find_files { cwd = '~/.config/', hidden = true }
      end,
      desc = '[s]earch [c]onfig files',
      silent = true,
      mode = 'n',
    },
    {
      '<leader>ut',
      function()
        require('telescope.builtin').colorscheme {
          enable_preview = true,
        }
      end,
      desc = 'Telescope [t]hemes',
      silent = true,
      mode = 'n',
    },
  },
  config = function(_, opts)
    require('telescope').setup(opts)

    require('telescope').load_extension 'fzf'
    require('telescope').load_extension 'live_grep_args'
    require('telescope').load_extension 'ui-select'
  end,
}
