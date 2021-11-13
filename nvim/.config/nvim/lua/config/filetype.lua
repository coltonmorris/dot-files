-- In init.lua or filetype.nvim's config file
require('filetype').setup({
    overrides = {
        extensions = {plz = 'python', build_defs = 'python'},
        literal = {
            -- Set the filetype of files named "MyBackupFile" to lua
            MyBackupFile = 'lua'
        },
        complex = {
            -- Set the filetype of any full filename matching the regex to gitconfig
            [".*git/config"] = "gitconfig" -- Included in the plugin
        },

        -- The same as the ones above except the keys map to functions
        function_extensions = {
            -- py = function()
            --     print('opening a python file!!!')
            --     vim.bo.filetype = 'python'
            -- end
        },
        function_literal = {
            -- Brewfile = function()
            --     vim.cmd("syntax off")
            -- end
        },
        function_complex = {}
    }
})
