vim.pack.add({ { src = 'https://github.com/akinsho/git-conflict.nvim', version = vim.version.range('*') } })

require('git-conflict').setup()

vim.api.nvim_set_hl(0, 'GitConflictCurrent', { bg = '#2c333a', fg = 'NONE', bold = true })
vim.api.nvim_set_hl(0, 'GitConflictIncoming', { bg = '#2e3b30', fg = 'NONE', bold = true })
vim.api.nvim_set_hl(0, 'GitConflictAncestor', { bg = '#332a2a', fg = 'NONE', bold = true })
vim.api.nvim_set_hl(0, 'GitConflictSeparator', { fg = '#4f5b66' })
-- vim.api.nvim_set_hl(0, 'GitConflictIncoming', { bg = '#2c333a', fg = 'NONE', bold = true })
    -- co — choose ours
    -- ct — choose theirs
    -- cb — choose both
    -- c0 — choose none
    -- ]x — move to previous conflict
    -- [x — move to next conflict

