require'lspconfig'.dartls.setup{
    cmd = { "dart", '/usr/lib/dart/bin/snapshots/analysis_server.dart.snapshot', "--lsp" },
    on_attach = require'config.lsp'.common_on_attach,
    capabilities = require'config.lsp'.common_capabilities(),
    init_options = {
      closingLabels = false,
      flutterOutline = false,
      onlyAnalyzeProjectsWithOpenFiles = false,
      outline = false,
      suggestFromUnimportedLibraries = true
    }
}
