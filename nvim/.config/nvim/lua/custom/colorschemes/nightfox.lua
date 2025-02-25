return {
  {
    "EdenEast/nightfox.nvim",
    enabled = false,
    lazy = false,
    opts = {
      palettes = {
        nordfox = {
          bg0 = "#353a43",
          bg1 = "#404651",
          bg2 = "#4b5260",
          bg3 = "#4d5567",
          bg4 = "#6c778e",

          sel0 = "#505c6d",
        },
      },
    },
    config = function(_, opts)
      require("nightfox").setup(opts)

      local palette = require("nightfox.palette").load("nightfox")

      local line_number_change_mode = vim.F.npcall(require, "line-number-change-mode")
      if line_number_change_mode ~= nil then
        line_number_change_mode.setup({
          mode = {
            i = {
              bg = palette.green.base,
              fg = palette.bg0,
              bold = true,
            },
            n = {
              bg = palette.blue.base,
              fg = palette.bg0,
              bold = true,
            },
            R = {
              bg = palette.red.base,
              fg = palette.bg0,
              bold = true,
            },
            v = {
              bg = palette.magenta.base,
              fg = palette.bg0,
              bold = true,
            },
            V = {
              bg = palette.magenta.base,
              fg = palette.bg0,
              bold = true,
            },
          },
        })
      end

      vim.cmd("colorscheme nordfox")
    end,
  },
}
