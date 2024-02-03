-- "gc" to comment visual regions/lines
return {
  "numToStr/Comment.nvim",
  config = function()
    require("Comment").setup({
      mappings = {
        basic = false,
        extra = false,
      },
    })
    local api = require("Comment.api")

    -- Toggle current line (linewise) using C-/
    vim.keymap.set("n", "<C-_>", api.toggle.linewise.current)

    local esc = vim.api.nvim_replace_termcodes("<ESC>", true, false, true)

    -- Toggle selection (linewise) using C-/
    vim.keymap.set("x", "<C-_>", function()
      vim.api.nvim_feedkeys(esc, "nx", false)
      api.toggle.linewise(vim.fn.visualmode())
    end)
  end,
}
