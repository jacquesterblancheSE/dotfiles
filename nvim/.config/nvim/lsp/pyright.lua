local python_path = vim.env.VIRTUAL_ENV and (vim.env.VIRTUAL_ENV .. "/bin/python")
  or (vim.fn.filereadable(vim.fn.getcwd() .. "/.venv/bin/python") == 1 and vim.fn.getcwd() .. "/.venv/bin/python")
  or vim.fn.exepath("python3")
  or vim.fn.exepath("python")

return {
  cmd = { "pyright-langserver", "--stdio" },
  filetypes = { "python" },
  settings = {
    python = {
      pythonPath = python_path,
    },
  },
}
