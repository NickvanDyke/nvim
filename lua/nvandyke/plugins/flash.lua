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
      search = {
        -- Just always integrate with search
        -- instead of having an entirely separate function.
        -- Mainly to keep s free for surround plugin.
        -- Can always just press enter to finish search normally;
        -- Seems like a win-win.
        -- enabled = true,
      },
    },
  },
  -- stylua: ignore
  keys = {
    -- TODO: have to wait for timeoutlen when using with `y` because of nvim-surround `ys` mapping
    { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    { "S", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
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
    -- '/',
    '?',
    'f',
    'F',
    't',
    'T',
  },
}
