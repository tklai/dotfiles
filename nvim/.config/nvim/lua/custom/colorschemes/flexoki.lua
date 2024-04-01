return {
  {
    "kepano/flexoki-neovim",
    as = "flexoki",
    enabled = false,
    lazy = false,
    config = function()
      vim.cmd.colorscheme("flexoki-light")
    end,
  },
}
