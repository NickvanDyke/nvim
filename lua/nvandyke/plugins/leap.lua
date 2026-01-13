return {
  'ggandor/leap.nvim',
  enabled = false,
  config = function()
    local clever_s = require('leap.user').with_traversal_keys('s', 'S')
    vim.keymap.set({ 'n', 'x', 'o' }, 's', function()
      require('leap').leap { opts = clever_s }
    end)
    vim.keymap.set({ 'n', 'x', 'o' }, 'S', function()
      require('leap').leap { opts = clever_s, backward = true }
    end)
  end,
}
