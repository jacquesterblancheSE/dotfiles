vim.pack.add({
  { src = "https://github.com/sindrets/diffview.nvim", version = vim.version.range('*') },
  { src = "https://github.com/nvim-tree/nvim-web-devicons", version = vim.version.range('*') }, 
})

local actions = require("diffview.actions")

require("diffview").setup({
  keymaps = {
    view = {
      { "n", "mo", actions.conflict_choose("ours"),   { desc = "Choose OURS" } },
      { "n", "mt", actions.conflict_choose("theirs"), { desc = "Choose THEIRS" } },
      { "n", "mb", actions.conflict_choose("both"),   { desc = "Choose BOTH" } },
      { "n", "m0", actions.conflict_choose("none"),   { desc = "Choose NONE" } },
    },
  },
})
