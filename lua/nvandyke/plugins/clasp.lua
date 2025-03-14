return {
  'xzbdmw/clasp.nvim',
  opts = {
    pairs = { ['{'] = '}', ['"'] = '"', ["'"] = "'", ['('] = ')', ['['] = ']', ['<'] = '>' },
    keep_insert_mode = true,
    remove_pattern = nil,
  },
  keys = {
    {
      '<c-;>',
      mode = { 'n', 'i' },
      function()
        require('clasp').wrap 'next'
      end,
    },
    {
      '<c-l>',
      mode = { 'n', 'i' },
      function()
        require('clasp').wrap 'prev'
      end,
    },
  },
}
