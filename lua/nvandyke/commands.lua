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
    if
      -- vim.bo.buflisted -- breaks orgmode capture auto-save. Not sure what else it might break lol.
      #vim.api.nvim_buf_get_name(0) ~= 0
      and vim.api.nvim_buf_get_option(0, 'modified') then
      vim.cmd 'silent w'

      -- local time = os.date '%I:%M %p'

      -- vim.notify('autosaved', vim.log.levels.INFO, { timeout = 1000 })
    end
  end,
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'markdown',
  desc = 'Set wrap for markdown files',
  callback = function()
    vim.wo.wrap = true
  end,
})

-- Restore cursor to file position in previous editing session
vim.api.nvim_create_autocmd("BufReadPost", {
    callback = function(args)
        local mark = vim.api.nvim_buf_get_mark(args.buf, '"')
        local line_count = vim.api.nvim_buf_line_count(args.buf)
        if mark[1] > 0 and mark[1] <= line_count then
            vim.cmd('normal! g`"zz')
        end
    end,
})
