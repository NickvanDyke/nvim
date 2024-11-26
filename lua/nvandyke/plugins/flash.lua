return {
  'folke/flash.nvim',
  ---@type Flash.Config
  opts = {
    label = {
      rainbow = {
        enabled = true,
      },
    },
    highlight = {
      -- backdrop = false,
    },
    modes = {
      char = {
        -- Prefer using flash for everything. Prevents conflict with surround plugin.
        -- enabled = false,
      },
      search = {
        -- Just always integrate with search
        -- instead of having an entirely separate function.
        -- Mainly to keep s free for surround plugin.
        -- Can always just press enter to finish search normally;
        -- Seems like a win-win.
        enabled = true,
      },
    },
  },
  -- stylua: ignore
  keys = {
    -- { "f", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    -- { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    -- { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
    -- { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    -- { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },

    {
      "R",
      mode = { "n", "x", "o" },
      function() require("flash").treesitter() end,
      desc = "Flash Treesitter",
    },
    {
      "r",
      mode = "o",
      function() require("flash").remote() end,
      desc = "Remote Flash",
    },
    '/',
    '?',
    'f',
    'F',
    't',
    'T',
  },
}
