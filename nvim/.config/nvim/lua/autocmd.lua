function define_augroups(definitions) -- {{{1
    -- Create autocommand groups based on the passed definitions
    --
    -- The key will be the name of the group, and each definition
    -- within the group should have:
    --    1. Trigger
    --    2. Pattern
    --    3. Text
    -- just like how they would normally be defined from Vim itself
    for group_name, definition in pairs(definitions) do
        vim.cmd('augroup ' .. group_name)
        vim.cmd('autocmd!')

        for _, def in pairs(definition) do
            local command = table.concat(vim.tbl_flatten {'autocmd', def}, ' ')
            vim.cmd(command)
        end

        vim.cmd('augroup END')
    end
end

local auto_formatters = {}

-- TODO why is wollemi not working?
-- local wollemi_autoformat = {
--     "BufWritePost *.go silent exec '!wollemi --log fatal gofmt' shellescape(expand('%:h'), 1)",
--     "BufWritePost *.plz silent exec '!wollemi --log fatal fmt' shellescape(expand('%:h'), 1)"
-- }
table.insert(auto_formatters, wollemi_autoformat)

local python_autoformat = {'BufWritePre', '*.py', 'lua vim.lsp.buf.formatting_sync(nil, 1000)'}
table.insert(auto_formatters, python_autoformat)

local javascript_autoformat = {'BufWritePre', '*.js', 'lua vim.lsp.buf.formatting_sync(nil, 1000)'}
local javascriptreact_autoformat = {'BufWritePre', '*.jsx', 'lua vim.lsp.buf.formatting_sync(nil, 1000)'}
local typescript_autoformat = {'BufWritePre', '*.ts', 'lua vim.lsp.buf.formatting_sync(nil, 1000)'}
local typescriptreact_autoformat = {'BufWritePre', '*.tsx', 'lua vim.lsp.buf.formatting_sync(nil, 1000)'}
table.insert(auto_formatters, javascript_autoformat)
table.insert(auto_formatters, javascriptreact_autoformat)
table.insert(auto_formatters, typescript_autoformat)
table.insert(auto_formatters, typescriptreact_autoformat)

-- TODO look here if lua formatting is annoying
local lua_format = {'BufWritePre', '*.lua', 'lua vim.lsp.buf.formatting_sync(nil, 1000)'}
table.insert(auto_formatters, lua_format)

local json_format = {'BufWritePre', '*.json', 'lua vim.lsp.buf.formatting_sync(nil, 1000)'}
table.insert(auto_formatters, json_format)

local ruby_format = {'BufWritePre', '*.rb', 'lua vim.lsp.buf.formatting_sync(nil,1000)'}
table.insert(auto_formatters, ruby_format)

local go_format = {'BufWritePre', '*.go', 'lua vim.lsp.buf.formatting_sync(nil,1000)'}
table.insert(auto_formatters, go_format)

define_augroups({
    _general_settings = {
        {'TextYankPost', '*', 'lua require(\'vim.highlight\').on_yank({higroup = \'Search\', timeout = 200})'},
        {'BufWinEnter', '*', 'setlocal formatoptions-=c formatoptions-=r formatoptions-=o'},
        {'BufRead', '*', 'setlocal formatoptions-=c formatoptions-=r formatoptions-=o'},
        {'BufNewFile', '*', 'setlocal formatoptions-=c formatoptions-=r formatoptions-=o'},
        {'VimLeavePre', '*', 'set title set titleold='}, {'FileType', 'qf', 'set nobuflisted'},
        {'BufEnter', '*', [[exe 'noremap <F5> :!open -a "Google Chrome" %:p:.<CR>']]}

        -- {'User', 'GoyoLeave', 'lua require(\'galaxyline\').disable_galaxyline()'},
        -- {'User', 'GoyoEnter', 'lua require(\'galaxyline\').galaxyline_augroup()'},
    },
    _java = {
        {'FileType', 'java', 'luafile ' .. CONFIG_PATH .. '/lua/lsp/java-ls.lua'},
        {'FileType', 'java', 'nnoremap ca <Cmd>lua require(\'jdtls\').code_action()<CR>'}
    },
    _markdown = {{'FileType', 'markdown', 'setlocal wrap'}, {'FileType', 'markdown', 'setlocal spell'}},
    _solidity = {
        {'BufWinEnter', '.sol', 'setlocal filetype=solidity'}, {'BufRead', '*.sol', 'setlocal filetype=solidity'},
        {'BufNewFile', '*.sol', 'setlocal filetype=solidity'}
    },
    _gemini = {
        {'BufWinEnter', '.gmi', 'setlocal filetype=markdown'}, {'BufRead', '*.gmi', 'setlocal filetype=markdown'},
        {'BufNewFile', '*.gmi', 'setlocal filetype=markdown'}
    },
    _buffer_bindings = {
        {'FileType', 'dashboard', 'nnoremap <silent> <buffer> q :q<CR>'},
        {'FileType', 'lspinfo', 'nnoremap <silent> <buffer> q :q<CR>'},
        {'FileType', 'floaterm', 'nnoremap <silent> <buffer> q :q<CR>'}
    },
    _auto_formatters = auto_formatters
})
