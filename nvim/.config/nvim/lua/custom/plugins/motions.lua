return {
  {
    "folke/flash.nvim",
    event = "VeryLazy",
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
    event = "BufEnter",
  },
  {
    "mg979/vim-visual-multi",
    event = "VeryLazy",
  },
  {
    "tris203/hawtkeys.nvim",
    event = "VeryLazy",
    config = true,
    opts = {},
  },
}
