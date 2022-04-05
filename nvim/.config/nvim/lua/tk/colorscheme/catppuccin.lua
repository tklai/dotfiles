local present, catppuccin = pcall(require, "catppuccin")
if not present then
  return
end

catppuccin.setup({
  transparent_background = true,
  integrations = {
    treesitter = true,
    telescope = true,
    bufferline = true,
    cmp = true,
  },
})

vim.cmd("colorscheme catppuccin")

local color_palette = require("catppuccin.core.color_palette")
local setHl = require("tk.utils").set_highlights

if pcall(require, "telescope") then
  local telescope_colors = {
    TelescopeNormal = {
      bg = color_palette.black2,
    },
    TelescopeSelection = {
      bg = color_palette.black2,
    },
    TelescopeBorder = {
      fg = color_palette.black2,
      bg = color_palette.black2,
    },
    TelescopePromptBorder = {
      fg = color_palette.black3,
      bg = color_palette.black3,
    },
    TelescopePromptNormal = {
      fg = color_palette.white,
      bg = color_palette.black3,
    },
    TelescopePromptPrefix = {
      fg = color_palette.red,
      bg = color_palette.black3,
    },
    TelescopePromptTitle = {
      fg = color_palette.black1,
      bg = color_palette.flamingo,
    },
    TelescopePreviewTitle = {
      fg = color_palette.black1,
      bg = color_palette.green,
    },
    TelescopePreviewNormal = {
      fg = color_palette.white,
      bg = color_palette.black2,
    },
    TelescopePreviewBorder = {
      fg = color_palette.black2,
      bg = color_palette.black2,
    },
    TelescopeResultsTitle = {
      fg = color_palette.black0,
      bg = color_palette.teal,
    },
    TelescopeResultsNormal = {
      fg = color_palette.white,
      bg = color_palette.black1,
    },
    TelescopeResultsBorder = {
      fg = color_palette.black1,
      bg = color_palette.black1,
    },
  }

  setHl(telescope_colors)
end
