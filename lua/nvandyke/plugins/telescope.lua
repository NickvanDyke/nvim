return { -- Fuzzy Finder (files, lsp, etc)
  'nvim-telescope/telescope.nvim',
  event = 'VimEnter',
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
    { 'nvim-telescope/telescope-ui-select.nvim' },

    -- Useful for getting pretty icons, but requires a Nerd Font.
    { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
    'nvim-telescope/telescope-live-grep-args.nvim',
  },
  config = function()
    local lga_actions = require 'telescope-live-grep-args.actions'
    local open_with_trouble = require('trouble.sources.telescope').open

    -- Use this to add more results without clearing the trouble list
    local add_to_trouble = require('trouble.sources.telescope').add

    -- Telescope is a fuzzy finder that comes with a lot of different things that
    -- it can fuzzy find! It's more than just a "file finder", it can search
    -- many different aspects of Neovim, your workspace, LSP, and more!
    --
    -- The easiest way to use Telescope, is to start by doing something like:
    --  :Telescope help_tags
    --
    -- After running this command, a window will open up and you're able to
    -- type in the prompt window. You'll see a list of `help_tags` options and
    -- a corresponding preview of the help.
    --
    -- Two important keymaps to use while in Telescope are:
    --  - Insert mode: <c-/>
    --  - Normal mode: ?
    --
    -- This opens a window that shows you all of the keymaps for the current
    -- Telescope picker. This is really useful to discover what Telescope can
    -- do as well as how to actually do it!

    -- [[ Configure Telescope ]]
    -- See `:help telescope` and `:help telescope.setup()`
    require('telescope').setup {
      -- You can put your default mappings / updates / etc. in here
      --  All the info you're looking for is in `:help telescope.setup()`
      --
      -- defaults = {
      --   mappings = {
      --     i = { ['<c-enter>'] = 'to_fuzzy_refine' },
      --   },
      -- },
      -- pickers = {}
      defaults = {
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
            ['<C-t>'] = open_with_trouble,
            ['<C-d>'] = require('telescope.actions').delete_buffer,
          },
          i = {
            ['<C-t>'] = open_with_trouble,
            ['<C-w>'] = function()
              vim.api.nvim_input '<c-s-w>'
            end,
          },
        },
      },
      extensions = {
        ['ui-select'] = {
          require('telescope.themes').get_dropdown(),
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
              ['<C-k>'] = lga_actions.quote_prompt(),
            },
          },
        },
      },
    }

    -- Enable Telescope extensions if they are installed
    pcall(require('telescope').load_extension, 'fzf')
    pcall(require('telescope').load_extension, 'ui-select')
    pcall(require('telescope').load_extension, 'live_grep_args')

    -- See `:help telescope.builtin`
    local builtin = require 'telescope.builtin'
    vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
    vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
    vim.keymap.set('n', '<leader>sb', builtin.builtin, { desc = '[S]earch Telescope [B]uiltins' })
    vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
    vim.keymap.set('n', '<leader>sg', ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>", { desc = '[S]earch with [G]rep (args)' })
    vim.keymap.set('n', '<leader><leader>', function()
      require('telescope').extensions.smart_open.smart_open {
        filename_first = false,
      }
    end, { desc = '[S]earch [S]mart Open' })

    -- Slightly advanced example of overriding default behavior and theme
    vim.keymap.set('n', '<C-/>', function()
      -- You can pass additional configuration to Telescope to change the theme, layout, etc.
      builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        winblend = 10,
        previewer = false,
      })
    end, { desc = '[/] Fuzzily search in current buffer' })

    -- It's also possible to pass additional configuration options.
    --  See `:help telescope.builtin.live_grep()` for information about particular keys
    -- vim.keymap.set('n', '<leader>s/', function()
    --   builtin.live_grep {
    --     grep_open_files = true,
    --     prompt_title = 'Live Grep in Open Files',
    --   }
    -- end, { desc = '[S]earch [/] in Open Files' })

    vim.keymap.set('n', '<leader>sc', function()
      builtin.find_files { cwd = '~/.config/', hidden = true }
    end, { desc = '[S]earch [C]onfig files' })
  end,
}
