local null_ls = require("null-ls")

null_ls.setup({
  sources = {
    null_ls.builtins.formatting.mix,
    null_ls.builtins.formatting.mix.with({
      command = "mix", -- The command to run mix
      args = { "format", "-" }, -- Use '-' to format from stdin
      filetypes = { "elixir" }, -- Make sure elixir is included
    }),
  },
})


vim.lsp.buf.format({
  async = false,
  filter = function(client)
    return client.name == "null-ls"
  end,
})

