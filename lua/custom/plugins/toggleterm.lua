return {
  'akinsho/toggleterm.nvim',
  version = '*',
  config = function()
    local Terminal = require('toggleterm.terminal').Terminal

    local lazygit = Terminal:new { cmd = 'lazygit', hidden = true, direction = 'float', dir = 'git_dir' }
    function _lazygit_toggle()
      lazygit:toggle()
    end
    vim.api.nvim_set_keymap('n', '<leader>lg', '<cmd>lua _lazygit_toggle()<CR>', { noremap = true, silent = true, desc = '[L]azy[G]it' })

    local lazydocker = Terminal:new { cmd = 'lazydocker', hidden = true, direction = 'float' }
    function _lazydocker_toggle()
      lazydocker:toggle()
    end
    vim.api.nvim_set_keymap('n', '<leader>ld', '<cmd>lua _lazydocker_toggle()<CR>', { noremap = true, silent = true, desc = '[L]azy[D]ocker' })

    -- Open terminal in buffer's current dir
    -- TODO: might be nice to (optionally) update as buffer changes
    vim.keymap.set({'n', 't'}, '<C-t>', '<cmd>ToggleTerm dir=\"%:p:h\"<cr>')

    require('toggleterm').setup {
      direction = 'float',
    }
  end,
}
