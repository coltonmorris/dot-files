require'lspconfig'.gopls.setup {
    cmd = {DATA_PATH .. "/lsp_servers/go/gopls"},
    -- TODO make sure these arent needed, we might be overrididng already sensible defaults
    settings = {gopls = {analyses = {unusedparams = true}, staticcheck = true}},
    init_options = {usePlaceholders = true, completeUnimported = true},
    on_attach = require'config.lsp'.common_on_attach,
    capabilities = require'config.lsp'.common_capabilities(),
}
