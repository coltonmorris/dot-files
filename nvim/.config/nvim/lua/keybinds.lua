-- Toggle the QuickFix window
vim.api.nvim_set_keymap('', '<C-q>', ':call QuickFixToggle()<CR>', {noremap = true, silent = true})

-- remap terminal mode to escape
vim.cmd([[tnoremap jj <C-\><C-n>]])
