-- npm install -g vscode-css-languageserver-bin
require'lspconfig'.cssls.setup {
    cmd = {
        "node", DATA_PATH .. "/lsp_servers/css/vscode-css/css-language-features/server/dist/node/cssServerMain.js",
        "--stdio"
    },
    on_attach = require'config.lsp'.common_on_attach,
    capabilities = require'config.lsp'.common_capabilities(),
}
