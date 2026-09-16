vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.swapfile = false
vim.opt.number = true
vim.opt.relativenumber = false
vim.opt.textwidth = 500
vim.opt.signcolumn = "yes"
vim.opt.diffopt:append("inline:word")
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.breakindent = true
vim.opt.clipboard = "unnamedplus" -- Route 'y' to the '+' register for OSC 52

-- Use OSC 52 to copy to local machine clipboard over SSH
vim.g.clipboard = {
  name = 'OSC 52',
  copy = {
    ['+'] = require('vim.ui.clipboard.osc52').copy('+'),
    ['*'] = require('vim.ui.clipboard.osc52').copy('*'),
  },
  paste = {
    ['+'] = require('vim.ui.clipboard.osc52').paste('+'),
    ['*'] = require('vim.ui.clipboard.osc52').paste('*'),
  },
}
vim.opt.showmode = false
vim.opt.cmdheight = 0

-- Neovim 0.12 native completion
vim.opt.autocomplete = true
vim.opt.completeopt = { "menu", "menuone", "noselect", "noinsert", "nearest" }
