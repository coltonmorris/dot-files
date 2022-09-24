local nvim_lsp = require'lspconfig'
local configs = require'lspconfig/configs'

configs.emmet_ls = {
  default_config = {
    on_attach = require'config.lsp'.common_on_attach,
    capabilities = require'config.lsp'.common_capabilities(),
    cmd = {'emmet-ls', '--stdio'};
    filetypes = {'html', 'css'};
    root_dir = function()
      return vim.loop.cwd()
    end;
    settings = {};
  };
}

nvim_lsp.emmet_ls.setup{
  -- on_attach = on_attach;
}
