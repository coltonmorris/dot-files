-- npm install -g dockerfile-language-server-nodejs
local lsp = require('config.lsp')
lsp.setup('dockerls', {
  cmd = { DATA_PATH .. "/lsp_servers/dockerfile/node_modules/.bin/docker-langserver", "--stdio" },
  on_attach = lsp.common_on_attach,
  capabilities = lsp.common_capabilities(),
  root_dir = function(bufnr, on_dir)
    on_dir(vim.loop.cwd())
  end,
})
