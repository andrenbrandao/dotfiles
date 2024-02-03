return {
  {
    "tpope/vim-fugitive",
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup({
        on_attach = function(bufnr)
          local gs = package.loaded.gitsigns

          local opts = { buffer = bufnr }

          -- Actions
          vim.keymap.set("n", "<leader>gs", gs.stage_hunk, opts)
          vim.keymap.set("n", "<leader>gr", gs.reset_hunk, opts)
          vim.keymap.set("v", "<leader>gs", function()
            gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
          end, opts)
          vim.keymap.set("v", "<leader>gr", function()
            gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
          end, opts)
          vim.keymap.set("n", "<leader>gS", gs.stage_buffer, opts)
          vim.keymap.set("n", "<leader>gu", gs.undo_stage_hunk, opts)
          vim.keymap.set("n", "<leader>gR", gs.reset_buffer, opts)
          vim.keymap.set("n", "<leader>gp", gs.preview_hunk, opts)
          vim.keymap.set("n", "<leader>gb", function()
            gs.blame_line({ full = true })
          end, opts)
          vim.keymap.set("n", "<leader>gtb", gs.toggle_current_line_blame, opts)
          vim.keymap.set("n", "<leader>gd", gs.diffthis, opts)
          vim.keymap.set("n", "<leader>gD", function()
            gs.diffthis("~")
          end, opts)
          vim.keymap.set("n", "<leader>gtd", gs.toggle_deleted, opts)
        end,
      })
    end,
  },
}
