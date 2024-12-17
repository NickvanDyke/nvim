---Return a stateful search predicate which picks a single
---result for each buffer in the given list
---@return Portal.SearchPredicate
local function different()
    local found = {}

    ---@param content Portal.Content
    ---@return boolean
    return function(content)
        if vim.tbl_contains(found, content.buffer) then
            return false
        end
        found[#found + 1] = content.buffer
        return true
    end
end

return {
  'cbochs/portal.nvim',
  opts = {
    window_options = {
      border = 'solid',
      height = 3,
    },
  },
  cmd = 'Portal',
  keys = {
    {
      '<S-C-o>',
      function()
        require('portal.builtin').jumplist {
          direction = 'backward',
          filter = different()
        }
      end,
      desc = 'Portal',
      mode = 'n',
    },
    {
      '<S-C-i>',
      function()
        require('portal.builtin').jumplist {
          direction = 'forward',
          filter = different()
        }
      end,
      desc = 'Portal',
      mode = 'n',
    },
  },
}
