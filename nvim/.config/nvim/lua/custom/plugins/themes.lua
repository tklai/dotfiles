return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    enabled = false,
    lazy = false,
    config = function()
      require("custom.colorscheme.catppuccin")
    end,
  },
  {
    "rebelot/kanagawa.nvim",
    -- enabled = false,
    lazy = false,
    config = function()
      require("custom.colorscheme.kanagawa")
    end,
  },
  {
    "folke/tokyonight.nvim",
    enabled = false,
    lazy = false,
    config = function()
      require("custom.colorscheme.tokyonight")
    end,
  },
}
