require'lspconfig'.texlab.setup{
    cmd = {DATA_PATH .. "/lsp_servers/latex/texlab"},
    on_attach = require'config.lsp'.common_on_attach
}
