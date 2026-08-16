return {
  {
    "neanias/everforest-nvim",
    -- enabled = false,
    lazy = false,
    priority = 1000,
    init = function()
      vim.o.background = "light"
    end,
    config = function()
      require("everforest").setup({
        background = "soft",
        ui_contrast = "high",
        inlay_hints_background = "dimmed",
      })

      vim.cmd.colorscheme("everforest")
    end,
  },
}
