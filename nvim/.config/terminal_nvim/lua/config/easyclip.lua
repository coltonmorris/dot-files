-- there is also a way to bind a toggle functionality for this
vim.g.EasyClipAutoFormat = 1

vim.g.EasyClipPreserveCursorPositionAfterYank = 1
-- allow for s<motion> to substitute over the given motion with a specifified
-- register. Use ss to paste over the line. Use gs the same as s but preserves
-- the cursor position

vim.g.EasyClipUseSubstituteDefaults = 1

-- control+v to use EasyClips pasting while in insert mode
vim.cmd("imap <c-v> <plug>EasyClipInsertModePaste")

-- map command+v to use EasyClips pasting while in insert mode... TODO not working 
vim.cmd("imap <silent> <D-v> <plug>EasyClipInsertModePaste")

-- remap the mark to be gm instead
vim.cmd("nnoremap gm m")

-- TODO wasnt working, so stopped using plugin
-- remap m to be cut and M to cut end of line
vim.cmd("nmap M <Plug>MoveMotionEndOfLinePlug")
