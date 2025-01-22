return {
    "kawre/leetcode.nvim",
    cmd = 'Leet',
    build = ":TSUpdate html", -- if you have `nvim-treesitter` installed
    dependencies = {
        "ibhagwan/fzf-lua",
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
    },
    opts = {
		lang = 'javascript'
    },
}
