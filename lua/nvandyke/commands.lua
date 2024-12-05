vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_autocmd('CursorHold', {
  desc = 'Trigger autoread (in case file changed externally)',
  callback = function()
    vim.cmd 'checktime'
  end,
})

vim.api.nvim_create_autocmd({ 'InsertLeave', 'TextChanged' }, {
  callback = function()
    if vim.bo.buflisted and #vim.api.nvim_buf_get_name(0) ~= 0 and vim.api.nvim_buf_get_option(0, 'modified') then
      vim.cmd 'silent w'

      -- local time = os.date '%I:%M %p'

      vim.notify('autosaved', vim.log.levels.INFO, { timeout = 1000 })
    end
  end,
})
