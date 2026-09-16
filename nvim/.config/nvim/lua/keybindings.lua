vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR><Esc>', { desc = "Clear search highlights" })
vim.keymap.set({ 'n', 'v' }, '<space>', '<nop>', { silent = true })
