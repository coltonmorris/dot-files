local lsp = require('config.lsp')
lsp.setup('elmls', {
  capabilities = lsp.common_capabilities(),
  on_attach = lsp.common_on_attach,
  cmd = { DATA_PATH .. "/lsp_servers/elm/node_modules/.bin/elm-language-server" },
  init_options = {
    elmAnalyseTrigger = "change",
    elmFormatPath = DATA_PATH .. "/lsp_servers/elm/node_modules/.bin/elm-format",
    elmPath = DATA_PATH .. "/lsp_servers/elm/node_modules/.bin/elm",
    elmTestPath = DATA_PATH .. "/lsp_servers/elm/node_modules/.bin/elm-test",
  },
})
