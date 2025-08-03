return {
  {
    "jsit/toast.vim",
    enabled = false,
    lazy = false,
    priority = 1000,
    config = function()
      vim.opt.background = "light"
      vim.cmd.colorscheme("toast")
    end,
  },
}
