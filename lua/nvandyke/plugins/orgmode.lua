return {
  {
    'nvim-orgmode/orgmode',
    enabled = false,
    event = 'VeryLazy',
    ft = { 'org' },
    opts = {
      org_agenda_files = '~/org/**/*',
      org_default_notes_file = '~/org/refile.org',
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
      directory = '~/org',
    },
  },
}
