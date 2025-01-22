return {
  'Goose97/timber.nvim',
  version = '*', -- Use for stability; omit to use `main` branch for the latest features
  keys = {
    { 'glj', '<cmd>lua require("timber").insert_log_below()<CR>', desc = 'Insert a log statement below the cursor' },
    { 'glk', '<cmd>lua require("timber").insert_log_above()<CR>', desc = 'Insert a log statement above the cursor' },
    { 'glo', '<cmd>lua require("timber").insert_plain_log_below()<CR>', desc = 'Insert a plain log statement below the cursor' },
    { 'gl<S-o>', '<cmd>lua require("timber").insert_plain_log_above()<CR>', desc = 'Insert a plain log statement above the cursor' },
    { 'gla', '<cmd>lua require("timber").add_log_targets_to_batch()<CR>', desc = 'Add a log target to the batch' },
    { 'glb', '<cmd>lua require("timber").insert_batch_log()<CR>', desc = 'Insert a batch log statement' },
  },
}
