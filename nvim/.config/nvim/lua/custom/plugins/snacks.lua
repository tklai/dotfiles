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
    },
  },
}
