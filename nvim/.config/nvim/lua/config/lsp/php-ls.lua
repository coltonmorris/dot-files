require'lspconfig'.intelephense.setup {
    cmd = { DATA_PATH .. "/lsp_servers/php/node_modules/.bin/intelephense", "--stdio" },
    on_attach = require'config.lsp'.common_on_attach,
    capabilities = require'config.lsp'.common_capabilities(),
}
