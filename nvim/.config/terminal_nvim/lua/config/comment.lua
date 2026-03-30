require('nvim_comment').setup({
    hook = function()
        local ok, parser = pcall(vim.treesitter.get_parser, 0)
        if not ok or parser == nil then
            return
        end
        pcall(function()
            require('ts_context_commentstring.internal').update_commentstring()
        end)
    end,
})

