return {
  {
    'nvim-orgmode/orgmode',
    event = 'VeryLazy',
    ft = { 'org' },
    opts = {
      org_agenda_files = '~/notes/**/*',
      org_default_notes_file = '~/notes/refile.org',
      win_border = 'rounded'
    },
  },
  {
    'akinsho/org-bullets.nvim',
    ft = { 'org' },
    opts = {},
  },
  {
    'chipsenkbeil/org-roam.nvim',
    enabled = false,
    opts = {
      directory = '~/notes',
    },
  },
}
