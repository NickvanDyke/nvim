return {
  'folke/flash.nvim',
  event = 'VeryLazy',
  ---@type Flash.Config
  opts = {
    modes = {
      search = {
        -- Just always integrate with search
        -- instead of having an entirely separate function.
        -- Mainly to keep s free for surround plugin.
        -- Can always just press enter to finish search normally;
        -- Seems like a win-win.
        enabled = true,
        highlight = {
          backdrop = false,
        }
      }
    }
  },
  -- stylua: ignore
  keys = {
    -- { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    -- { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    -- { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
    -- { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    -- { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },

    { "R", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
    -- Not really sure what this does over just treesitter()?
    -- { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
  },
}
