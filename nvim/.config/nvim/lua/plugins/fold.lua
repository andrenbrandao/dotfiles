-- Autofold Plugin
return {
  "kevinhwang91/nvim-ufo",
  dependencies = { "kevinhwang91/promise-async" },
  init = function()
    vim.o.foldlevel = 99
    vim.o.foldlevelstart = 99
  end,
  config = function()
    require("ufo").setup({})
  end,
}
