return {
  'lewis6991/gitsigns.nvim',
  event = 'BufReadPre',
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
      end, { desc = 'Next Git hunk' })

      map('n', '[g', function()
        if vim.wo.diff then
          vim.cmd.normal { '[g', bang = true }
        else
          gitsigns.nav_hunk 'prev'
        end
      end, { desc = 'Previous Git hunk' })

      -- Actions
      -- visual mode
      map('v', '<leader>gs', function()
        gitsigns.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
      end, { desc = 'stage hunk' })
      map('v', '<leader>gr', function()
        gitsigns.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
      end, { desc = 'reset hunk' })
      -- normal mode
      map('n', '<leader>gs', gitsigns.stage_hunk, { desc = 'Stage hunk' })
      map('n', '<leader>gr', gitsigns.reset_hunk, { desc = 'Reset hunk' })
      map('n', '<leader>gS', gitsigns.stage_buffer, { desc = 'Stage buffer' })
      map('n', '<leader>gu', gitsigns.undo_stage_hunk, { desc = 'Undo stage hunk' })
      map('n', '<leader>gR', gitsigns.reset_buffer, { desc = 'Reset buffer' })
      map('n', '<leader>gp', gitsigns.preview_hunk, { desc = 'Preview hunk' })
      map('n', '<leader>gd', gitsigns.diffthis, { desc = 'Diff against index' })
      map('n', '<leader>gD', function()
        gitsigns.diffthis '@'
      end, { desc = 'Diff against last commit' })
    end,
  },
}
