return {
  {
    "nvim-telescope/telescope.nvim",
    event = "BufEnter",
    dependencies = {
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
      },
    },
    config = function()
      require("custom.config.telescope")
    end,
  },
}
