local lsp = require('config.lsp')
lsp.setup('dartls', {
  cmd = { "dart", '/usr/lib/dart/bin/snapshots/analysis_server.dart.snapshot', "--lsp" },
  on_attach = lsp.common_on_attach,
  capabilities = lsp.common_capabilities(),
  init_options = {
    closingLabels = false,
    flutterOutline = false,
    onlyAnalyzeProjectsWithOpenFiles = false,
    outline = false,
    suggestFromUnimportedLibraries = true,
  },
})
