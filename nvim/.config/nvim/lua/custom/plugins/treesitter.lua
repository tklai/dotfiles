return {
  {
    "nvim-treesitter/nvim-treesitter",
    event = "BufEnter",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-context",
      "nvim-treesitter/nvim-treesitter-textobjects",
      {
        "nvim-treesitter/playground",
        enabled = false,
        cmd = "TSPlaygroundToggle",
      },
      "windwp/nvim-ts-autotag",
    },
    build = ":TSUpdate",
    config = function()
      require("custom.config.treesitter")
    end,
  },
}
