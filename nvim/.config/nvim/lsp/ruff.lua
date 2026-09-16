return {
  cmd = { "ruff", "server" },
  filetypes = { "python" },
  on_attach = function(client)
    client.server_capabilities.hoverProvider = false
    client.server_capabilities.completionProvider = nil
  end,
}
