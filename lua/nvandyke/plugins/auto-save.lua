return {
  'okuuva/auto-save.nvim',
  opts = {
    -- noautocmd = true, -- Don't run autocmds, specifically Conform auto-format
    -- For when we e.g. `cdo` in quickfix
    write_all_buffers = true,
  },
}
