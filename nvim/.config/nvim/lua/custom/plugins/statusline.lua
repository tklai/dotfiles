return {
  {
    "nvim-lualine/lualine.nvim",
    event = "UIEnter",
    dependencies = {
      {
        "nvim-tree/nvim-web-devicons",
        lazy = true,
      },
    },
    opts = {
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = {
          {
            "filename",
            path = 1,
          },
        },
        lualine_x = { "encoding", "fileformat", "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
    },
  },
}
