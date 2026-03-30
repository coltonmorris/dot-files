local util = require('lspconfig.util')
local lsp = require('config.lsp')

lsp.setup('vuels', {
  cmd = { DATA_PATH .. "/lsp_servers/vue/node_modules/.bin/vls", "--stdio" },
  on_attach = lsp.common_on_attach,
  capabilities = lsp.common_capabilities(),
  root_dir = function(bufnr, on_dir)
    local fname = vim.api.nvim_buf_get_name(bufnr)
    on_dir(util.root_pattern(".git", ".")(fname))
  end,
})
