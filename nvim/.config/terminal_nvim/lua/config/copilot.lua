require('copilot').setup({
  -- we disable it so that copilot-cmp can work
  panel = {
    -- enabled = false,
    enabled = true,
    -- auto_refresh = false,
    -- keymap = {
    --   jump_prev = "[[",
    --   jump_next = "]]",
    --   accept = "<CR>",
    --   refresh = "gr",
    --   open = "<M-CR>"
    -- },
    -- layout = {
    --   position = "bottom", -- | top | left | right | horizontal | vertical
    --   ratio = 0.4
    -- },
  },
  -- we disable it so that copilot-cmp can work
  suggestion = {
    -- enabled = false,
    enabled = true,
    -- auto_trigger = false,
    -- hide_during_completion = true,
    -- debounce = 75,
    -- trigger_on_accept = true,
    -- keymap = {
    --   accept = "<M-l>",
    --   accept_word = false,
    --   accept_line = false,
    --   next = "<M-]>",
    --   prev = "<M-[>",
    --   dismiss = "<C-]>",
    -- },
  },
  copilot_node_command = '/Users/colton.morris/.nvm/versions/node/v20.9.0/bin/node', -- Node.js version must be > 20
  copilot_model = "gpt-4o-copilot",  -- Current LSP default is gpt-35-turbo, supports gpt-4o-copilot
})
