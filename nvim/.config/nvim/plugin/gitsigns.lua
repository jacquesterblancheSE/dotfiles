vim.pack.add({ { src = 'https://github.com/nvim-mini/mini.diff', version = vim.version.range('*') } })

require('mini.diff').setup({
  view = {
    style = 'sign',
    signs = { add = '┃', change = '┃', delete = '_' },
  },
  mappings = {
    goto_prev = '[c',
    goto_next = ']c',
    textobject = 'gh',

    apply = '',
    reset = '',
    goto_first = '',
    goto_last = '',
  },
})

local map = function(mode, lhs, rhs, opts)
  opts = opts or {}
  vim.keymap.set(mode, lhs, rhs, opts)
end

map('n', '<leader>hr', function() return MiniDiff.operator('reset') .. 'gh' end, { expr = true, remap = true, desc = "Reset Hunk" })
map('x', '<leader>hr', function() return MiniDiff.operator('reset') end, { expr = true, desc = "Reset Selected" })
map('n', '<leader>hp', function() MiniDiff.toggle_overlay() end, { desc = "Toggle Diff Overlay" })
