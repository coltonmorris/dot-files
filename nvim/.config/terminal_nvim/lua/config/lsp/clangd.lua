require'lspconfig'.clangd.setup {
    cmd = {DATA_PATH .. "/lsp_servers/clangd/clangd/bin/clangd", "--offset-encoding=utf-16"},
    -- cmd = {"clangd"},
    on_attach = require'config.lsp'.common_on_attach,
    capabilities = require'config.lsp'.common_capabilities(),
    handlers = {
        ["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
            virtual_text = {spacing = 0, prefix = ""},
            signs = true,
            underline = true,
            update_in_insert = true
        })
    },
}
