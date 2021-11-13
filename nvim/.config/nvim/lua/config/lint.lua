local nvim_lint = require('lint')

nvim_lint.linters_by_ft = {go = {'revive'}}
nvim_lint.linters.revive.args = {'-config', '/Users/colton/gomod/git.tcncloud.net/m/neo/config.toml'}

-- run the linter on files that are defined
local function enable_lint()
    local bufnr = vim.api.nvim_get_current_buf()

    -- TODO why is vim.bo.filetype empty? it shows up if you type :lua print(vim.bo.filetype)
    -- if not nvim_lint.linters_by_ft[vim.bo.filetype] then return end
    if vim.bo.filetype ~= "" then print("COLTON: the filetype check for nvim-lint is working now") end

    -- TODO when filetype works update the *.go with <buffer=%d>
    vim.cmd(string.format("augroup lint_go", bufnr))
    vim.cmd("au!")
    vim.cmd(string.format("au ColorScheme *.go lua require'lint'.try_lint()", bufnr))
    vim.cmd(string.format("au BufReadPre *.go lua require'lint'.try_lint()", bufnr))
    vim.cmd(string.format("au BufWritePost *.go lua require'lint'.try_lint()", bufnr))
    vim.cmd(string.format("au BufEnter *.go lua require'lint'.try_lint()", bufnr))
    vim.cmd("augroup end")
end

enable_lint()
