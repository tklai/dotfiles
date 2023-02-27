return {
  "neovim/nvim-lspconfig",
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  "jose-elias-alvarez/null-ls.nvim",
  {
    "mfussenegger/nvim-dap",
    enabled = false,
    lazy = true,
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "theHamsta/nvim-dap-virtual-text",
    },
  },
  "b0o/schemastore.nvim",
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
}
