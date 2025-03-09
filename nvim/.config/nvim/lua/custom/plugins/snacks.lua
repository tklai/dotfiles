---@module "snacks"

return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      bigfile = { enabled = true },
      dim = {
        enabled = false,
        animate = { enabled = false },
      },
      indent = {
        enabled = true,
        animate = { enabled = false },
      },
      scope = { enabled = true },
      scroll = { enabled = true },
      zen = {
        enabled = true,
        show = { statusline = true, tabline = true },
        win = {
          border = "rounded",
          backdrop = {
            transparent = false,
          },
          height = 0.95,
          width = 0.6,
        },
      },
    },
    keys = {
      {
        "<leader>z",
        function()
          Snacks.zen.zen()
        end,
        desc = "Zen Mode",
      },
    },
  },
}
