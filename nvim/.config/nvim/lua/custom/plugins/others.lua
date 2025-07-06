return {
  {
    "mbbill/undotree",
    cmd = "UndotreeToggle",
    keys = {
      { "<leader>ud", vim.cmd.UndotreeToggle },
    },
    config = function ()
      vim.g.undotree_WindowLayout = 4
      vim.g.undotree_SplitWidth = 40
    end,
  },
}
