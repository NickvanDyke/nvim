return {
  'oflisback/obsidian-bridge.nvim',
  dependencies = { 'nvim-telescope/telescope.nvim', 'nvim-lua/plenary.nvim' },
  events = {
    -- `ft` causes it to load for floating windows, like LSP hover
    'BufRead *.md',
    'BufWrite *.md',
  },
  opts = {
    -- TODO: no luck with https server thus far
    -- obsidian_server_address = 'https://127.0.0.1:27124/',
  },
}
