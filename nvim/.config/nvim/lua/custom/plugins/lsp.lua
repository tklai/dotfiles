return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "b0o/schemastore.nvim",
        version = false,
      },
    },
  },
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  "jose-elias-alvarez/null-ls.nvim",
  {
    "mfussenegger/nvim-dap",
    lazy = true,
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "theHamsta/nvim-dap-virtual-text",
    },
  },
  {
    "kevinhwang91/nvim-ufo",
    dependencies = {
      "kevinhwang91/promise-async",
    },
    event = "BufEnter",
  },
  {
    "glepnir/lspsaga.nvim",
    branch = "main",
    event = "BufRead",
    config = true,
  },
  {
    "ray-x/lsp_signature.nvim",
    enabled = false,
    opts = {
      noice = true,
    },
  },
  {
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    config = true,
    init = function()
      require("tk.utils.keymap").nnoremap("<leader>L", require("lsp_lines").toggle, { desc = "Toggle LSP Lines" })
    end,
  }
}
