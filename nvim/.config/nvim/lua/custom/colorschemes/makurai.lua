return {
  {
    "Skardyy/makurai-nvim",
    -- enabled = false,
    lazy = false,
    priority = 1000,
    config = function()
      vim.opt.background = "light"

      require("makurai").setup({
        transparent = false,
      })

      vim.cmd.colorscheme("makurai_healer")
    end,
  },
}
