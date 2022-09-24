require'lspconfig'.svelte.setup {
    cmd = {DATA_PATH .. "/lsp_servers/svelte/node_modules/.bin/svelteserver", "--stdio"},
    on_attach = require'config.lsp'.common_on_attach,
    capabilities = require'config.lsp'.common_capabilities(),
}
