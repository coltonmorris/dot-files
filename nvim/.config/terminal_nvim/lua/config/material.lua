local material = require 'material'
local colors = require 'material.colors'

material.setup{
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

    plugins = { -- Uncomment the plugins that you use to highlight them
        -- Available plugins:
        -- "dap",
        -- "dashboard",
        "gitsigns",
        -- "hop",
        "indent-blankline",
        -- "lspsaga",
        -- "mini",
        -- "neogit",
        "nvim-cmp",
        -- "nvim-navic",
        -- "nvim-tree",
        -- "sneak",
        "telescope",
        -- "trouble",
        "which-key",
    },

    disable = {
        background = false, -- Prevent the theme from setting the background (NeoVim then uses your terminal background)
    },

    high_visibility = {
        lighter = false, -- Enable higher contrast text for lighter style
        darker = false -- Enable higher contrast text for darker style
    },

    -- Investigate the different groups here:
    --      https://github.com/marko-cerovac/material.nvim/blob/main/lua/material/colors/init.lua
    custom_colors = function(colors)
        colors.editor.selection = "#c2f2ee"
    end
}

vim.g.material_style = "lighter"

vim.cmd('set background=light')
vim.cmd('colorscheme material')
