return {
  'akinsho/toggleterm.nvim',
  version = '*',
  config = function()
    local Terminal = require('toggleterm.terminal').Terminal

    local lazygit = Terminal:new { cmd = 'lazygit', hidden = true, direction = 'float' }
    function _lazygit_toggle()
      lazygit:toggle()
    end
    vim.api.nvim_set_keymap('n', '<leader>lg', '<cmd>lua _lazygit_toggle()<CR>', { noremap = true, silent = true, desc = '[L]azy[G]it' })

    local lazydocker = Terminal:new { cmd = 'lazydocker', hidden = true, direction = 'float' }
    function _lazydocker_toggle()
      lazydocker:toggle()
    end
    vim.api.nvim_set_keymap('n', '<leader>ld', '<cmd>lua _lazydocker_toggle()<CR>', { noremap = true, silent = true, desc = '[L]azy[D]ocker' })

    require('toggleterm').setup {
      open_mapping = [[<c-\>]],
      direction = 'float',
    }
  end,
}
