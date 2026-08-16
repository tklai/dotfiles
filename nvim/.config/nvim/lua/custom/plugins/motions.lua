return {
  {
    "folke/flash.nvim",
    keys = {
      {
        "s",
        mode = { "n", "o", "x" },
        function()
          require("flash").jump()
        end,
      },
      {
        "S",
        mode = { "n", "o", "x" },
        function()
          require("flash").treesitter()
        end,
      },
    },
    opts = {
      modes = {
        search = { enabled = false },
      },
    },
  },
  {
    "chaoren/vim-wordmotion",
    event = { "BufReadPost", "BufNewFile" },
  },
  {
    "mg979/vim-visual-multi",
    keys = {
      { "<C-n>", mode = { "n", "x" }, desc = "Find Multiple" },
    },
  },
}
