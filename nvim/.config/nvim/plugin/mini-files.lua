vim.pack.add({ { src = 'https://github.com/echasnovski/mini.files', version = vim.version.range('*') } })

require("mini.files").setup({
  windows = { preview = false },
  options = { use_as_default_explorer = true },
})

-- Override mini.files highlights to remove the large grey float background
-- that appears in default Neovim themes like habamax.
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    -- Link to Normal so the background matches your editor exactly
    vim.api.nvim_set_hl(0, "MiniFilesNormal", { link = "Normal" })
    -- Remove the background from the border
    local border_hl = vim.api.nvim_get_hl(0, { name = "FloatBorder" })
    vim.api.nvim_set_hl(0, "MiniFilesBorder", { fg = border_hl.fg, bg = "NONE" })
  end,
})

-- Run it once immediately in case the ColorScheme event already fired
vim.api.nvim_set_hl(0, "MiniFilesNormal", { link = "Normal" })
local border_hl = vim.api.nvim_get_hl(0, { name = "FloatBorder" })
vim.api.nvim_set_hl(0, "MiniFilesBorder", { fg = border_hl.fg, bg = "NONE" })

vim.keymap.set('n', '-', function()
  require("mini.files").open(vim.api.nvim_buf_get_name(0), true)
end, { desc = "Open mini.files (Current file)" })

vim.keymap.set('n', '_', function()
  require("mini.files").open(vim.fn.getcwd(), true)
end, { desc = "Open mini.files (Project root)" })
