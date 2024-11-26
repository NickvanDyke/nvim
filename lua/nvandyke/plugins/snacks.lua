return {
  'folke/snacks.nvim',
  dependencies = { 'folke/persistence.nvim' },
  priority = 1000,
  lazy = false,
  opts = {
    dashboard = {
      enabled = true,

      sections = {
        { section = 'header' },
        { icon = ' ', title = 'Keymaps', section = 'keys', indent = 2, padding = 1 },
        { icon = ' ', title = 'Recent Files', section = 'recent_files', indent = 2, padding = 1 },
        { icon = ' ', title = 'Projects', section = 'projects', indent = 2, padding = 1 },
        { section = 'startup' },
      },
    },
    bigfile = { enabled = true },
    terminal = {
      enabled = true,
      win = {
        wo = {
          -- TODO: how to disable this? Don't need with prompt
          winbar = nil,
        },
      },
    },
    lazygit = { enabled = true },
    words = { enabled = true },
    statuscolumn = { enabled = false },
    notifier = {
      enabled = false,
      top_down = false,
      -- style = 'minimal'
    },
    styles = {},
  },
  keys = {
    {
      ']]',
      function()
        Snacks.words.jump(vim.v.count1)
      end,
      desc = 'Next Reference',
    },
    {
      '[[',
      function()
        Snacks.words.jump(-vim.v.count1)
      end,
      desc = 'Prev Reference',
    },
    {
      '<C-t>',
      function()
        Snacks.terminal()
      end,
      desc = 'Toggle Terminal',
    },
    {
      '<leader>ld',
      function()
        Snacks.terminal 'lazydocker'
      end,
      desc = '[L]azy [D]ocker',
    },
    {
      '<leader>lg',
      function()
        Snacks.lazygit.open()
      end,
      desc = '[L]azy [G]it',
    },
    {
      '<leader>gf',
      function()
        Snacks.lazygit.log_file()
      end,
      desc = 'LazyGit log (current [f]ile)',
    },
    {
      '<leader>gl',
      function()
        Snacks.lazygit.log()
      end,
      desc = 'LazyGit [l]og',
    },
  },
  config = function(_, opts)
    require('snacks').setup(opts)

    ---@type table<number, {token:lsp.ProgressToken, msg:string, done:boolean}[]>
    -- local progress = vim.defaulttable()
    -- vim.api.nvim_create_autocmd('LspProgress', {
    --   ---@param ev {data: {client_id: integer, params: lsp.ProgressParams}}
    --   callback = function(ev)
    --     local client = vim.lsp.get_client_by_id(ev.data.client_id)
    --     local value = ev.data.params.value --[[@as {percentage?: number, title?: string, message?: string, kind: "begin" | "report" | "end"}]]
    --     if not client or type(value) ~= 'table' then
    --       return
    --     end
    --     local p = progress[client.id]
    --
    --     for i = 1, #p + 1 do
    --       if i == #p + 1 or p[i].token == ev.data.params.token then
    --         p[i] = {
    --           token = ev.data.params.token,
    --           msg = ('[%3d%%] %s%s'):format(
    --             value.kind == 'end' and 100 or value.percentage or 100,
    --             value.title or '',
    --             value.message and (' **%s**'):format(value.message) or ''
    --           ),
    --           done = value.kind == 'end',
    --         }
    --         break
    --       end
    --     end
    --
    --     local msg = {} ---@type string[]
    --     progress[client.id] = vim.tbl_filter(function(v)
    --       return table.insert(msg, v.msg) or not v.done
    --     end, p)
    --
    --     local spinner = { '⠋', '⠙', '⠹', '⠸', '⠼', '⠴', '⠦', '⠧', '⠇', '⠏' }
    --     vim.notify(table.concat(msg, '\n'), 'info', {
    --       id = 'lsp_progress',
    --       title = client.name,
    --       opts = function(notif)
    --         notif.icon = #progress[client.id] == 0 and ' ' or spinner[math.floor(vim.uv.hrtime() / (1e6 * 80)) % #spinner + 1]
    --       end,
    --     })
    --   end,
    -- })
  end,
  init = function()

  end,
}
