require'lspconfig'.rust_analyzer.setup{
    cmd = {DATA_PATH .. "/lsp_servers/rust/rust-analyzer"},
    on_attach = require'config.lsp'.common_on_attach
}

