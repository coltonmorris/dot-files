-- If you are using rvm, make sure to change below configuration
local lsp = require('config.lsp')
lsp.setup('solargraph', {
  cmd = { DATA_PATH .. "/lsp_servers/ruby/solargraph/solargraph", "--stdio" },
  on_attach = lsp.common_on_attach,
  capabilities = lsp.common_capabilities(),
  filetypes = { 'rb', 'erb', 'rakefile' },
})
