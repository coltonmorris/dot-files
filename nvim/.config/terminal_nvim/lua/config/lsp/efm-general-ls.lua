-- Example configuations here: https://github.com/mattn/efm-langserver


-- sh
local sh_linter = 'shellcheck'
local sh_formatter = 'shfmt'
local sh_arguments = {}
local shfmt = {formatCommand = 'shfmt -ci -s -bn', formatStdin = true}

local shellcheck = {
    LintCommand = 'shellcheck -f gcc -x',
    lintFormats = {'%f:%l:%c: %trror: %m', '%f:%l:%c: %tarning: %m', '%f:%l:%c: %tote: %m'}
}

if sh_formatter == 'shfmt' then table.insert(sh_arguments, shfmt) end

if sh_linter == 'shellcheck' then table.insert(sh_arguments, shellcheck) end

-- tsserver/web javascript react, vue, json, html, css, yaml
-- local prettier = {formatCommand = "prettier --stdin-filepath ${INPUT}", formatStdin = true}
-- You can look for project scope Prettier and Eslint with e.g. vim.fn.glob("node_modules/.bin/prettier") etc. If it is not found revert to global Prettier where needed.
local prettier = {formatCommand = "./node_modules/.bin/prettier --stdin-filepath ${INPUT}", formatStdin = true}

-- local markdownlint = {
--     -- TODO default to global lintrc
--     -- lintcommand = 'markdownlint -s -c ./markdownlintrc',
--     lintCommand = 'markdownlint -s',
--     lintStdin = true,
--     lintFormats = {'%f:%l %m', '%f:%l:%c %m', '%f: %l: %m'}
-- }

local markdownPandocFormat = {formatCommand = 'pandoc -f markdown -t gfm -sp --tab-stop=2', formatStdin = true}

require"lspconfig".efm.setup {
    -- init_options = {initializationOptions},
    cmd = {DATA_PATH .. "/lsp_servers/efm/efm-langserver"},
    init_options = {documentFormatting = true, codeAction = false},
    filetypes = {
        "sh", "html", "css", "json",
        "yaml", "markdown", "vue"
    },
    on_attach = require'config.lsp'.common_on_attach,
    capabilities = require'config.lsp'.common_capabilities(),
    settings = {
        rootMarkers = {".git/"},
        languages = {
            sh = sh_arguments,
            html = {prettier},
            css = {prettier},
            json = {prettier},
            yaml = {prettier},
            markdown = {markdownPandocFormat}
            -- markdown = {markdownPandocFormat, markdownlint},
        }
    }
}

-- Also find way to toggle format on save
-- maybe this will help: https://superuser.com/questions/439078/how-to-disable-autocmd-or-augroup-in-vim
