return {
  {
    "numToStr/Comment.nvim",
    event = "BufEnter",
    config = true,
    opts = {
      mappings = {
        extra = false,
      },
    },
  },
  {
    "folke/todo-comments.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  {
    "danymat/neogen",
    event = "BufEnter",
    dependencies = {
      { "nvim-treesitter/nvim-treesitter" },
    },
    opts = {},
    init = function()
      vim.keymap.set("n", "<leader>aa", require("neogen").generate, { desc = "Generate annotations" })
    end,
  },
}
