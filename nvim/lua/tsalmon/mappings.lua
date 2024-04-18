vim.g.mapleader = " "
vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"

vim.opt.whichwrap:append {
    ['<'] = true,
    ['>'] = true,
    ['['] = true,
    [']'] = true,
    h = true,
    l = true,
}

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
