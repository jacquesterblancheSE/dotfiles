-- =============================================================================
-- INIT.LUA
-- =============================================================================
vim.loader.enable() -- Enables fast module loading
require("vim._core.ui2").enable({})
require("theme")
require("keybindings")
require("options")
require("lsp")

-- =============================================================================
-- AUTOCOMMANDS
-- =============================================================================
vim.api.nvim_create_autocmd("FileType", {
  pattern = "python",
  callback = function()
    vim.opt_local.textwidth = 88
    vim.opt_local.formatexpr = "" 
    vim.opt_local.formatoptions:remove({ "t", "c", "a" })
    vim.opt_local.formatoptions:append({ "q", "j" })
  end,
})
