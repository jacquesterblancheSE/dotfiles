vim.cmd.colorscheme("zaibatsu")

local modus_bg = "#0d0e15"
local org_gold = "#E5C07B"
local cyan     = "#56B6C2"
local green    = "#98C379"
local grey     = "#5C6370"

local groups_to_darken = {
  "Normal",       -- Main editor background
  "NormalNC",     -- Unfocused window background
  "SignColumn",   -- The gutter on the left (git signs, errors)
  "LineNr",       -- The line number column
  "EndOfBuffer",  -- The empty space below the end of the file
}

for _, group in ipairs(groups_to_darken) do
  -- Fetch the existing zaibatsu settings for this group
  local existing = vim.api.nvim_get_hl(0, { name = group })
  existing.bg = modus_bg
  vim.api.nvim_set_hl(0, group, existing)
end


vim.api.nvim_set_hl(0, "MiniFilesCursorLine", { bg = "NONE", fg = org_gold, bold = true })
vim.api.nvim_set_hl(0, "MiniFilesDirectory", { fg = org_gold })
vim.api.nvim_set_hl(0, "MiniFilesTitleFocused", { fg = org_gold, bold = true })


-- Explicitly style the Treesitter markdown capture groups
vim.api.nvim_set_hl(0, "@markup.heading", { fg = org_gold, bold = true })
vim.api.nvim_set_hl(0, "@markup.raw", { fg = green })                   -- Inline `code`
vim.api.nvim_set_hl(0, "@markup.raw.block", { fg = green })             -- Code blocks
vim.api.nvim_set_hl(0, "@markup.link.label", { fg = cyan })             -- The [text] in a link
vim.api.nvim_set_hl(0, "@markup.link.url", { fg = grey, underline = true }) -- The (url) in a link
vim.api.nvim_set_hl(0, "@markup.list", { fg = org_gold, bold = true })  -- Bullet points
vim.api.nvim_set_hl(0, "@markup.strong", { bold = true })               -- **Bold** text
vim.api.nvim_set_hl(0, "@markup.italic", { italic = true })             -- *Italic* text
vim.api.nvim_set_hl(0, "@markup.quote", { fg = grey, italic = true })   -- > Blockquotes

-- Force standard floating windows (like LSP diagnostics) to dark background
vim.api.nvim_set_hl(0, "NormalFloat", { bg = modus_bg, fg = "#cdd6f4" })
vim.api.nvim_set_hl(0, "FloatBorder", { bg = modus_bg, fg = cyan })
vim.api.nvim_set_hl(0, "FloatTitle",  { bg = modus_bg, fg = org_gold, bold = true })
