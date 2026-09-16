vim.pack.add({ { src = 'https://github.com/nvim-treesitter/nvim-treesitter', version = vim.version.range('*') } })

local parsers = {
  "javascript", "lua", "vim", "vimdoc", "c",
  "query", "python", "terraform", "json", "toml", "yaml",
  "markdown", "markdown_inline"
}

require("nvim-treesitter").install(parsers)

vim.api.nvim_create_autocmd('FileType', {
  pattern = parsers,
  callback = function(args)
    -- Start treesitter for the buffer
    local ok = pcall(vim.treesitter.start, args.buf)

    -- Enable experimental treesitter indentation, EXCEPT for python and c
    local ft = vim.bo[args.buf].filetype
    if ft ~= "python" and ft ~= "c" and ok then
      vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end
  end,
})
