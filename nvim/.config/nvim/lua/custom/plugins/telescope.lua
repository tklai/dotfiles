return {
  {
    "nvim-telescope/telescope.nvim",
    event = "BufEnter",
    dependencies = {
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
      },
      "nvim-telescope/telescope-media-files.nvim",
    },
    config = function ()
      require('custom.config.telescope')
    end
  },
}
