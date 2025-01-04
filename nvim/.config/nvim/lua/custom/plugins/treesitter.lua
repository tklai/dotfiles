return {
  {
    "nvim-treesitter/nvim-treesitter",
    event = "BufEnter",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-context",
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        auto_install = true,
        ensure_installed = {
          "bash",
          "css",
          "html",
          "javascript",
          "json",
          "lua",
          "markdown",
          "php_only",
          "regex",
          "scss",
          "tsx",
          "typescript",
          "vim",
          "vimdoc",
        },
        highlight = { enable = true },
        indent = { enable = true },
      })

      require("treesitter-context").setup({
        multiline_threshold = 2,
      })
    end,
  },
  {
    "Wansmer/treesj",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    event = "VeryLazy",
    opts = {
      use_default_keymaps = false,
    },
    init = function()
      vim.keymap.set("n", "<leader>m", "<cmd>TSJToggle<CR>", { desc = "Join / Split" })
    end,
  },
}
