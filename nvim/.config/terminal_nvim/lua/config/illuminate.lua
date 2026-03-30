-- Treesitter provider uses nvim-treesitter.locals; on nvim-treesitter `main` this can error
-- (e.g. locals.lua containing_scope / parent). LSP + regex are enough for same-word highlight.
require('illuminate').configure({
  providers = { 'lsp', 'regex' },
})
