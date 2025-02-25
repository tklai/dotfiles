return {
  {
    "jsit/toast.vim",
    enabled = false,
    lazy = false,
    config = function()
      vim.opt.background = "light"
      vim.cmd.colorscheme("toast")
    end,
  },
}
