require('material').setup({
    borders = true,

    italics = {comments = true},

    lualine_style = 'default',

    italics = {
            comments = true, -- Enable italic comments
    },

    contrast = {
        sidebars = true, -- Enable contrast for sidebar-like windows ( for example Nvim-Tree )
        floating_windows = true, -- Enable contrast for floating windows
        line_numbers = true, -- Enable contrast background for line numbers
        sign_column = true, -- Enable contrast background for the sign column
        cursor_line = true, -- Enable darker background for the cursor line
        non_current_windows = true, -- Enable darker background for non-current windows
        popup_menu = true, -- Enable lighter background for the popup menu
    },
})

vim.g.material_style = "lighter"

vim.cmd('set background=light')
vim.cmd('colorscheme material')
