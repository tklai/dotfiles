---@module "snacks"

return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      bigfile = {
        enabled = true,
        notify = false,
      },
      dim = {
        enabled = false,
        animate = { enabled = false },
      },
      indent = {
        enabled = true,
        animate = { enabled = false },
      },
      statuscolumn = { enabled = true },
      scope = { enabled = true },
      zen = {
        enabled = true,
        toggles = {
            dim = false,
        },
        show = { statusline = true, tabline = true },
        win = {
          backdrop = {
            transparent = false,
            blend = 80,
          },
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
