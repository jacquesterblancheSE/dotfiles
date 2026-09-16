-- ============================================================================
-- 1. Diagnostics Setup
-- ============================================================================
vim.diagnostic.config({
  virtual_text = false,
  virtual_lines = false,
  underline = true,
})

-- ============================================================================
-- 2. LspAttach Autocmd (Waits for servers to attach)
-- ============================================================================
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    local opts = { buffer = ev.buf }
    local client = vim.lsp.get_client_by_id(ev.data.client_id)

    -- From old init.lua: Override formatexpr
    vim.bo[ev.buf].formatexpr = ""

    if client and client:supports_method('textDocument/completion') then
      vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
    end

    -- Keymaps
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'gl', vim.diagnostic.open_float, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, { buffer = ev.buf, desc = "LSP Code Actions" })
    vim.keymap.set({ 'n', 'v' }, '<leader>cf', function()
      vim.lsp.buf.format({ async = true })
    end, { buffer = ev.buf, desc = "Format selection or file" })
  end,
})

-- ============================================================================
-- 3. Enable Native LSPs (Requires binaries on $PATH)
-- ============================================================================
-- Neovim 0.11+ automatically reads tables from `nvim/lsp/<server>.lua`
vim.lsp.enable("lua_ls")
vim.lsp.enable("pyright")
vim.lsp.enable("ruff")
vim.lsp.enable("jsonls")

-- Optional: Improve completion experience natively
vim.opt.completeopt:append("noselect")
