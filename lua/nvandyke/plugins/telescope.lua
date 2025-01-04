return {
  'nvim-telescope/telescope.nvim',
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
      layout_strategy = 'flex',
      layout_config = {
        -- prompt_position = 'top',
        -- vertical = {
        --   mirror = true
        -- }
      },
      mappings = {
        n = {
          ['q'] = function(prompt_bufnr)
            require('telescope.actions').close(prompt_bufnr)
          end,
          ['<esc>'] = function(prompt_bufnr)
            require('telescope.actions').close(prompt_bufnr)
          end,
          -- ['<C-t>'] = require('trouble.sources.telescope').open,
          -- ['<C-d>'] = require('telescope.actions').delete_buffer,
        },
        i = {
          ['<C-s>'] = function(prompt_bufnr)
            require('telescope.actions').select_horizontal(prompt_bufnr)
          end,
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
      -- TODO: don't think I can do this lazily?
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
      desc = 'Search Help',
      silent = true,
      mode = 'n',
    },
    {
      '<leader>sk',
      function()
        require('telescope.builtin').keymaps()
      end,
      desc = 'Search Keymaps',
      silent = true,
      mode = 'n',
    },
    {
      '<leader>sb',
      function()
        require('telescope.builtin').builtin()
      end,
      desc = 'Search Telescope Builtins',
      silent = true,
      mode = 'n',
    },
    {
      '<leader>sw',
      function()
        require('telescope-live-grep-args.shortcuts').grep_word_under_cursor()
      end,
      desc = 'Search current Word',
      silent = true,
      mode = 'n',
    },
    {
      '<leader>sg',
      ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>",
      desc = 'Search with Grep (args)',
      silent = true,
      mode = 'n',
    },
    {
      '<leader>sq',
      function()
        require('telescope.builtin').quickfix()
      end,
      desc = 'Search Quickfix',
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
      desc = '/ Fuzzily search in current buffer',
      silent = true,
      mode = 'n',
    },
    {
      '<leader>sc',
      function()
        require('telescope.builtin').find_files { cwd = '~/.config/', hidden = true }
      end,
      desc = 'Search Config files',
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
      desc = 'Telescope Themes',
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
