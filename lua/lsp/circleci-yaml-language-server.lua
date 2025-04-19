return {
  cmd = { 'circleci-yaml-language-server', '--stdio' },
  filetypes = { 'yaml' },
  root_markers = { '.circleci/config.yml' },
}
