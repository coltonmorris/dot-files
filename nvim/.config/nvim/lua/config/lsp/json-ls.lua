-- npm install -g vscode-json-languageserver
require'lspconfig'.jsonls.setup {
    cmd = {
        "node", DATA_PATH .. "/lsp_servers/json/vscode-json/json-language-features/server/dist/node/jsonServerMain.js",
        "--stdio"
    },
    on_attach = require'config.lsp'.common_on_attach,
    capabilities = require'config.lsp'.common_capabilities(),

    commands = {
        Format = {
            function()
                vim.lsp.buf.range_formatting({}, {0, 0}, {vim.fn.line("$"), 0})
            end
        }
    }
}
