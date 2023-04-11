-- require'lspconfig'.rust_analyzer.setup{
--     cmd = {DATA_PATH .. "/lsp_servers/rust/rust-analyzer"},
--     on_attach = require'config.lsp'.common_on_attach,
--     capabilities = require'config.lsp'.common_capabilities(),
-- }

-- the rust-tools plugin handles lspconfig's use of rust-analyzer, so we make sure not to use it
local rt = require("rust-tools")

rt.setup({
    server = {
        on_attach = function(client, bufnr)
            require'config.lsp'.common_on_attach(client, bufnr)

            -- Hover actions
            vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
            -- Code action groups
            vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
        end,
    },
})
