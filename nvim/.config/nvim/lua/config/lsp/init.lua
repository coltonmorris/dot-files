local lsp_config = {}

function lsp_config.common_on_attach(client, bufnr)
    lsp_config.keybinds()

    require'lsp_signature'.on_attach()
end

function lsp_config.tsserver_on_attach(client, bufnr)
    lsp_config.common_on_attach(client, bufnr)
    -- TODO why was this needed? if not we can get rid of the tsserver attach
    client.resolved_capabilities.document_formatting = false
end

function lsp_config.common_capabilities(client, bufnr)
    local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

    return capabilities
end

-- TODO these probably arent needed, i think they are already set in which-key
-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
-- local opts = { noremap=true, silent=true }
-- vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
-- vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
-- vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
-- vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

function lsp_config.keybinds()
    -- Use an on_attach function to only map the following keys
    -- after the language server attaches to the current buffer

    -- TODO get this working
    -- Enable completion triggered by <c-x><c-o>
    -- vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
end

return lsp_config
