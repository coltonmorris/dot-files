local lsp = require('config.lsp')
lsp.setup('svelte', {
  cmd = { DATA_PATH .. "/lsp_servers/svelte/node_modules/.bin/svelteserver", "--stdio" },
  on_attach = lsp.common_on_attach,
  capabilities = lsp.common_capabilities(),
})
