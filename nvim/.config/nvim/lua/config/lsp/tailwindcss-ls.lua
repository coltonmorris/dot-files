local lspconfig = require 'lspconfig'
local configs = require 'lspconfig/configs'
local util = require"lspconfig".util

-- Check if tailwindls server already defined.
if not lspconfig.tailwindls then configs['tailwindls'] = {default_config = {}} end

lspconfig.tailwindls.setup {
    cmd = {
        "node", DATA_PATH .. "/lsp_servers/tailwindcss/tailwindcss-intellisense/extension/dist/server/tailwindServer.js",
        "--stdio"
    },
    filetypes = {'html', 'css', 'scss', 'javascript', 'javascriptreact', 'typescript', 'typescriptreact'},
    init_options = {
        userLanguages = { -- I don't know why but the LSP won't autocomplete the tailwind classes without this
        }
    },
    root_dir = function(fname)
        return util.root_pattern('tailwind.config.js', 'tailwind.config.ts')(fname) or
        util.root_pattern('postcss.config.js', 'postcss.config.ts')(fname) or
        util.find_package_json_ancestor(fname) or
        util.find_node_modules_ancestor(fname) or
        util.find_git_ancestor(fname)
    end,
    on_attach = require'config.lsp'.common_on_attach,
    capabilities = require'config.lsp'.common_capabilities(),
}
