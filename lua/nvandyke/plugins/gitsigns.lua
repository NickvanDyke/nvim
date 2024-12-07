return {
  'lewis6991/gitsigns.nvim',
  event = 'VeryLazy',
  opts = {
    on_attach = function(bufnr)
      local gitsigns = require 'gitsigns'

      local function map(mode, l, r, opts)
        opts = opts or {}
        opts.buffer = bufnr
        vim.keymap.set(mode, l, r, opts)
      end

      map('n', ']g', function()
        if vim.wo.diff then
          vim.cmd.normal { ']g', bang = true }
        else
          gitsigns.nav_hunk 'next'
        end
      end, { desc = 'Jump to next [g]it hunk' })

      map('n', '[g', function()
        if vim.wo.diff then
          vim.cmd.normal { '[g', bang = true }
        else
          gitsigns.nav_hunk 'prev'
        end
      end, { desc = 'Jump to previous [g]it hunk' })

      -- Actions
      -- visual mode
      map('v', '<leader>gs', function()
        gitsigns.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
      end, { desc = 'stage hunk' })
      map('v', '<leader>gr', function()
        gitsigns.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
      end, { desc = 'reset hunk' })
      -- normal mode
      map('n', '<leader>gs', gitsigns.stage_hunk, { desc = '[s]tage hunk' })
      map('n', '<leader>gr', gitsigns.reset_hunk, { desc = '[r]eset hunk' })
      map('n', '<leader>gS', gitsigns.stage_buffer, { desc = '[S]tage buffer' })
      map('n', '<leader>gu', gitsigns.undo_stage_hunk, { desc = '[u]ndo stage hunk' })
      map('n', '<leader>gR', gitsigns.reset_buffer, { desc = '[R]eset buffer' })
      map('n', '<leader>gp', gitsigns.preview_hunk, { desc = '[p]review hunk' })
      map('n', '<leader>gb', gitsigns.blame_line, { desc = '[b]lame line' })
      map('n', '<leader>gd', gitsigns.diffthis, { desc = '[d]iff against index' })
      map('n', '<leader>gD', function()
        gitsigns.diffthis '@'
      end, { desc = '[D]iff against last commit' })
      -- Toggles
      map('n', '<leader>tb', gitsigns.toggle_current_line_blame, { desc = '[t]oggle show [b]lame line' })
      map('n', '<leader>tD', gitsigns.toggle_deleted, { desc = '[t]oggle show [D]eleted' })
    end,
  },
}
