return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")

    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.stylua.with({
          extra_args = { "--indent-type", "Spaces", "--indent-width", 2 },
        }),
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.diagnostics.eslint,
        null_ls.builtins.completion.spell,
      },

      -- code extracted from https://github.com/jose-elias-alvarez/null-ls.nvim/wiki/Formatting-on-save
      on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
          -- not sure if this group string is correct
          vim.api.nvim_clear_autocmds({ group = "UserLspConfig", buffer = bufnr })
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = "UserLspConfig",
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format({
                bufnr = bufnr,
                filter = function(client)
                  return client.name == "null-ls"
                end,
              })
            end,
          })
        end
      end,
    })
  end,
}
