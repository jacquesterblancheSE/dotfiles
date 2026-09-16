vim.pack.add({ { src = 'https://github.com/folke/snacks.nvim', version = vim.version.range('*') } })

require("snacks").setup({
  picker = {
    layout = { preset = "ivy" },
    enabled = true,
    sources = {
      files = { hidden = true },
      grep = { hidden = true },
    },
    win = {
      input = { bo = { autocomplete = false } },
    },
  },
})

vim.keymap.set('n', '<leader>ff', function() Snacks.picker.files() end, { desc = "Snacks find files" })
vim.keymap.set('n', '<leader>fg', function() Snacks.picker.grep() end, { desc = "Snacks live grep" })
vim.keymap.set('n', '<leader>fb', function() Snacks.picker.buffers() end, { desc = "Snacks buffers" })
vim.keymap.set('n', '<leader>fh', function() Snacks.picker.help() end, { desc = "Snacks help tags" })
vim.keymap.set('n', '<leader>f.', function()
  Snacks.picker.files({ cwd = vim.fn.expand("%:p:h"), args = { "--max-depth", "1" } })
end, { desc = "Files in same folder" })