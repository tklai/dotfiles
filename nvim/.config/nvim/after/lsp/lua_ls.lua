return {
  settings = {
    Lua = {
      telemetry = { enable = false },
      completion = {
        workspaceWord = true,
        callSnippet = "Replace",
      },
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = {
          [vim.fn.expand("$VIMRUNTIME/lua")] = true,
          [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
        },
      },
      format = {
        enable = false,
      },
      hint = {
        enable = true,
      },
    },
  },
}
