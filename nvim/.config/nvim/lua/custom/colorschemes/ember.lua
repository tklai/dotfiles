return {
  {
    "ember-theme/nvim",
    name = "ember",
    enabled = false,
    lazy = false,
    priority = 1000,
    config = function()
      vim.opt.background = "light"

      vim.cmd("colorscheme ember-light")
    end,
  }
}
