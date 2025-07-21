return {
  {
    "stevearc/oil.nvim",
    keys = {
      { "-", "<CMD>Oil<CR>", desc = "Open parent directory" },
    },
    opts = {
      delete_to_trash = true,
      keymaps = {
        ["<C-v>"] = { "actions.select", opts = { vertical = true }, desc = "Open the entry in a vertical split" },
        ["<C-x>"] = { "actions.select", opts = { horizontal = true }, desc = "Open the entry in a horizontal split" },
      },
    },
  },
  {
    "A7Lavinraj/fyler.nvim",
    enabled = false,
    cmd = "Fyler",
    keys = {
      { "<C-b>", "<cmd>Fyler kind=split:right<CR>", desc = "Toggle NvimTree" },
    },
    dependencies = { "nvim-tree/nvim-web-devicons" },
    branch = "stable",
    opts = {},
  },
}
