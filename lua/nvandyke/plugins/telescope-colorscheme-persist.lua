return {
  "tingey21/telescope-colorscheme-persist.nvim",
  enabled = false,
  dependencies = { "nvim-telescope/telescope.nvim" },
  lazy = false,
  config = function()
    require("telescope-colorscheme-persist").setup({
      keybind = "<leader>tt",
    })
  end,
}

