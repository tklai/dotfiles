return {
  {
    "mbbill/undotree",
    init = function()
      vim.g.undotree_WindowLayout = 4
      vim.g.undotree_SplitWidth = 40
    end,
    keys = {
      { "<leader>ud", vim.cmd.UndotreeToggle },
    },
    opts = {},
  },
  {
    "tpope/vim-sleuth",
    lazy = false,
  },
}
