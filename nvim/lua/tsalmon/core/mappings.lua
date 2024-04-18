vim.g.mapleader = " "

vim.keymap.set("i", "JJ", "<Esc>", { noremap = false })
-- Buffers
vim.keymap.set("n", "<S-TAB>", ":bprev<enter>", { noremap = false })
vim.keymap.set("n", "<TAB>", ":bnext<enter>", { noremap = false })
vim.keymap.set("n", "<leader>q", ":Bdelete<enter>", { noremap = false })
vim.keymap.set('n', '<leader>b', ':enew<enter>', { noremap = false })
-- Files
vim.keymap.set("n", "<leader>s", ":w!<enter>", { noremap = false })
vim.keymap.set("n", "E", "$", { noremap = false })
vim.keymap.set("n", "A", "^", { noremap = false })
-- System Clipboard
vim.keymap.set('n','y','"+y')
vim.keymap.set('n','yy','"+yy')
vim.keymap.set('n','Y','"+Y')
vim.keymap.set('x','y','"+y')
vim.keymap.set('x','Y','"+Y')

