-- this is the alternating tab indent coloring
vim.cmd [[highlight IndentOdd guifg=NONE guibg=NONE gui=nocombine]]
vim.cmd [[highlight IndentEven guifg=NONE guibg=#e2e9e9 gui=nocombine]]
vim.g.indent_blankline_char_highlight_list = {"IndentOdd", "IndentEven"}
vim.g.indent_blankline_space_char_highlight_list = {"IndentOdd", "IndentEven"}
vim.g.indent_blankline_char = " "
vim.g.indent_blankline_space_char = " "
-- when using background, the trailing indent is not needed / looks wrong
vim.g.indent_blankline_show_trailing_blankline_indent = false
vim.g.indent_blankline_use_treesitter = true
