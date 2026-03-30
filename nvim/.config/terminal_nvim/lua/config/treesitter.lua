-- nvim-treesitter `main` (see :h nvim-treesitter-quickstart). Neovim 0.12+ and `tree-sitter` CLI with `build` (e.g. brew `tree-sitter-cli`).
require('nvim-treesitter').setup({})

local ensure = { 'go', 'javascript', 'typescript', 'python' }
require('nvim-treesitter').install(ensure)

-- Indent when a parser exists (no global TS highlight — material.nvim)
vim.api.nvim_create_autocmd('FileType', {
  pattern = '*',
  callback = function(args)
    local ok, parser = pcall(vim.treesitter.get_parser, args.buf)
    if not ok or not parser then
      return
    end
    vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end,
})

require('nvim-ts-autotag').setup({
  opts = {
    enable_close = true,
    enable_rename = true,
    enable_close_on_slash = false,
  },
})

require('nvim-treesitter-textobjects').setup({
  select = {
    lookahead = true,
    include_surrounding_whitespace = true,
  },
  move = {
    set_jumps = true,
  },
})

local select = require('nvim-treesitter-textobjects.select')
local move = require('nvim-treesitter-textobjects.move')
local swap = require('nvim-treesitter-textobjects.swap')

local function map_select(modes, lhs, capture)
  vim.keymap.set(modes, lhs, function()
    select.select_textobject(capture, 'textobjects')
  end)
end

map_select({ 'x', 'o' }, 'af', '@function.outer')
map_select({ 'x', 'o' }, 'if', '@function.inner')
map_select({ 'x', 'o' }, 'aC', '@class.outer')
map_select({ 'x', 'o' }, 'iC', '@class.inner')
map_select({ 'x', 'o' }, 'ac', '@conditional.outer')
map_select({ 'x', 'o' }, 'ic', '@conditional.inner')
map_select({ 'x', 'o' }, 'ae', '@block.outer')
map_select({ 'x', 'o' }, 'ie', '@block.inner')
map_select({ 'x', 'o' }, 'al', '@loop.outer')
map_select({ 'x', 'o' }, 'il', '@loop.inner')
map_select({ 'x', 'o' }, 'is', '@statement.inner')
map_select({ 'x', 'o' }, 'as', '@statement.outer')
map_select({ 'x', 'o' }, 'ad', '@comment.outer')
map_select({ 'x', 'o' }, 'am', '@call.outer')
map_select({ 'x', 'o' }, 'im', '@call.inner')

vim.keymap.set({ 'x', 'o' }, 'iL', function()
  if vim.bo.filetype == 'go' then
    select.select_textobject('@function.inner', 'textobjects')
  end
end)

-- rustaceanvim uses `<Leader>a` for codeAction; swap on `<leader>sa` / `<leader>sA`
vim.keymap.set('n', '<leader>sa', function()
  swap.swap_next('@parameter.inner')
end)
vim.keymap.set('n', '<leader>sA', function()
  swap.swap_previous('@parameter.inner')
end)

vim.keymap.set({ 'n', 'x', 'o' }, ']m', function()
  move.goto_next_start('@function.outer', 'textobjects')
end)
vim.keymap.set({ 'n', 'x', 'o' }, ']]', function()
  move.goto_next_start('@class.outer', 'textobjects')
end)
vim.keymap.set({ 'n', 'x', 'o' }, ']M', function()
  move.goto_next_end('@function.outer', 'textobjects')
end)
vim.keymap.set({ 'n', 'x', 'o' }, '][', function()
  move.goto_next_end('@class.outer', 'textobjects')
end)
vim.keymap.set({ 'n', 'x', 'o' }, '[m', function()
  move.goto_previous_start('@function.outer', 'textobjects')
end)
vim.keymap.set({ 'n', 'x', 'o' }, '[[', function()
  move.goto_previous_start('@class.outer', 'textobjects')
end)
vim.keymap.set({ 'n', 'x', 'o' }, '[M', function()
  move.goto_previous_end('@function.outer', 'textobjects')
end)
vim.keymap.set({ 'n', 'x', 'o' }, '[]', function()
  move.goto_previous_end('@class.outer', 'textobjects')
end)

-- gnn/grn/grc/grm were from nvim-treesitter `master` incremental_selection; not on `main` (add custom maps if needed).

require('ts_context_commentstring').setup({
  enable_autocmd = false,
})
