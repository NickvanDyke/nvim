return {
  'okuuva/auto-save.nvim',
  event = 'TextChanged',
  opts = {
    -- noautocmd = true, -- Don't run autocmds, specifically Conform auto-format
    -- For when we e.g. `cdo` in quickfix
    write_all_buffers = true,
    condition = function(buf)
      local ft = vim.bo[buf].filetype
      return ft ~= 'harpoon'
    end,
  },
}
