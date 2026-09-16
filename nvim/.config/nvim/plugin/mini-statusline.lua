vim.pack.add({ { src = 'https://github.com/echasnovski/mini.statusline', version = vim.version.range('*') } })
require('mini.statusline').setup({ use_icons = true })

local function set_mode_colors()
  local text = '#1e1e1e' -- Dark text for contrast against the colored backgrounds
  
  local modes = {
    Normal  = '#007acc', -- Blue
    Insert  = '#6a9955', -- Green
    Visual  = '#c586c0', -- Pink
    Replace = '#f44747', -- Red
    Command = '#ce9178', -- Orange
    Other   = '#4fc1ff', -- Light Blue
  }

  for mode, color in pairs(modes) do
    vim.api.nvim_set_hl(0, 'MiniStatuslineMode' .. mode, { fg = text, bg = color, bold = true })
  end
end

set_mode_colors()

vim.api.nvim_create_autocmd("ColorScheme", { callback = set_mode_colors })
