return {
  {
    "jay-babu/mason-null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("mason-null-ls").setup({
        ensure_installed = {
          "prettier",
          "stylua",
          "buildifier",
          "ruff",
        },
        automatic_installation = true,
      })
    end,
  },
  {
    "nvimtools/none-ls.nvim",
    config = function()
      local null_ls = require("null-ls")
      local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

      null_ls.setup({
        sources = {
          null_ls.builtins.formatting.stylua.with({
            extra_args = { "--indent-type", "Spaces", "--indent-width", 2 },
          }),
          null_ls.builtins.formatting.prettier,
          null_ls.builtins.formatting.buildifier,
          null_ls.builtins.diagnostics.eslint,
          null_ls.builtins.completion.spell,
        },

        -- code extracted from hhttps://github.com/nvimtools/none-ls.nvim/wiki/Formatting-on-save
        on_attach = function(client, bufnr)
          if client.server_capabilities.documentFormattingProvider then
            -- not sure if this group string is correct
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
              group = augroup,
              buffer = bufnr,
              callback = function()
                vim.lsp.buf.format({ async = false })
              end,
            })
          end
        end,
      })
    end,
  },
}
